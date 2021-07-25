#use Grammar::Tracer;
grammar P4-explain {
  token TOP { [<cd>]+
    {
      my %_;
      %_ .= append: .made for $/<cd>;
      %_{%_.keys} = %_.values.map({
        .List.unique.classify( {$_.key}, :as{ $_.value });
      });
      make %_
    }
  }
  proto token cd { * }
        token cd:sym<pr> { <des>+  <cmd>
          { make %({ my $a = .made; $a.value.push: (arg => $/<cmd>.made);$a } for $/<des>)}
        }
        token cd:sym<im> { <err> { make {} }| <cmd> { make {} }}

  token des { <fl> ': ' (\S+ [\h \S+]*) \n
    { make $( ~$/.chop => [flag => $/<fl>.made]) }
  }

  token fl { <lf> <sf>? { make .made for $/<>:v }}
  token lf { '--' (\w+ ['-' \w+]*) '['? '='? [ \w+ '=N'? ','?]* ']'? { make ~$/[0] } }
  token sf { ' (-' (\w) ')' {make  ~$/[0] }}

  token cmd { [ 'Usage: ' '-c client '? | 'p4 [ -p port ] ' ] (\w+ ['/' \w+]*) [\h+ \S+]* \n { make ~$/[0].split('/') }}

  token err {
    | 'Perforce client ' \S+ [\n\t \S+ [\h \S+]*]+ \n
    | [\t|\s+] \S+ [\h \S+]* \n+
  }
}.parsefile('p4e.txt').made.say
