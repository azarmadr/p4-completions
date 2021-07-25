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
  token des { <fl> ': ' <ds> \n
    { make $( $/<ds>.made => [flag => $/<fl>.made]) }
  }
  token ds { \S+ [\h \S+]* { make $/.Str.chop } }

  token fl { <lf> <sf>? { make .made for $/<>:v }}
  token lf { '--' \w+ ['-' \w+]* '['? '='? [ \w+ '=N'? ','?]* ']'? { make $/.Str } }
  token sf { ' (-' \w ')' {make  '-' ~ $/.split('')[4] }}

  token cmd { [ 'Usage: ' '-c client '? | 'p4 [ -p port ] ' ] <ar> [\h+ \S+]* \n { make $/<ar>.made }}
  token ar { \w+ ['/' \w+]* { make .Str for $/.split('/') }}

  token err {
    | 'Perforce client ' \S+ [\n\t \S+ [\h \S+]*]+ \n
    | [\t|\s+] \S+ [\h \S+]* \n+
  }
}
