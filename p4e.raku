#use Grammar::Tracer;
grammar P4-explain {
  token TOP {
    [<cd>]+
    { make @($/<cd>).elems }
  }
  proto token cd { * }
        token cd:sym<pr> { <des>+  <cmd> { make $/<des>.map: { .made.value.prepend($_) }
        token cd:sym<im> { <err> | <cmd> }
  #proto token line          { * }
  token cmd { 'Usage: ' '[ -p port ] '? <ar> [\h+ \S+]* \n { make $/<ar> }}
  token des { <lf> <sf>? ': ' <ds> \n { make $/<ds> => ($/<lf>, $/<sf>) }}
  token err { 'Perforce client ' \S+ [\n\t \S+ [\h \S+]*]+ \n }
  #token er2 { \t \S+ [\h \S+]* }
  token lf { '--' \w+ ['-' \w+]* '['? '='? [ \w+ '=N'? ','?]* ']'? }
  token sf { ' (-' \w ')' } #'-' \w+ |
  token ds { \S+ [\h \S+]* { make $/ } }
  token ar { \w+ ['/' \w+]* { make $/.split('/') }}
}.parsefile('p4e.txt').made.say