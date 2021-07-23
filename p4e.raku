use Grammar::Tracer;
grammar P4-explain {
  token TOP {
    [<line> \n]+
    { make @($/<line>).elems }
  }
  proto token line          { * }
        token line:sym<cmd> { 'Usage: ' \w+ ['/' \w+]* [\h+ \S+]* { make $/.words[1] }}
        token line:sym<des> { <lf> <sf>? ': ' <ds> { make $/<ds> => ($/<lf>, $/<sf>) }}
        token line:sym<err> { 'Perforce client ' \S+ [\n\t \S+ [\h \S+]*]+ }
  token lf { '--' \w+ ['-' \w+]* '['? '='? [ \w+ '=N'? ','?]* ']'? }
  token sf { ' (-' \w ')' } #'-' \w+ |
  token ds { \S+ [\h \S+]* { make $/ } }
}.parse('p4-explain.txt'.IO.slurp).made.say