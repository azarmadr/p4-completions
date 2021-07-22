#use Grammar::Tracer;
grammar Cmd-Des {
  rule TOP ($*pre, $*ex, $*suf) {
    [<.ws> <des>]**{$*pre} <.ws> <cd>+ [<.ws> <des>]**{$*suf}
  }
  token cd { <.ws> <cmd> \s+ <des> $$ { make $/<cmd>.made => $/<des>.made } }
  token des {  \S+ [ \s \S+ ]* { make $/.Str } }
  token cmd { <.ex>**{$*ex} \w+ { make ~$/.words[*-1] } }
  token ex  { 'p4 help' <.ws> }
}
class P4-actions {
  method TOP ($/) { make %($/<cd>.map: { .made }) }
}
#my $tem = P4C-help.parsefile('p4-help.txt');
#my $__fish = 1 ?? '__fish_contains_opt' !! '__fish_seen_subcommand_from';
# Parsing and creating fish completion's
my $p4fc = open 'p4-completion.fish', :w;
with Cmd-Des.parsefile('p4-help-cmds.txt', :args((1,0,6)), actions => P4-actions.new).made {
  $p4fc.say: $('set -l p4_client_commands ' ~ .keys.join(' ') ~ "\n").subst(' help','');
  $p4fc.say: 'complete -f -c p4 -n "not __fish_seen_subcommand_from help" -a help -d "Print the requested help message"';
  for .kv -> $c, $d {
    $p4fc.say: 'complete -f -c p4 -n "__fish_seen_subcommand_from help; or not __fish_seen_subcommand_from $p4_client_commands" -a ' ~ "$c -d \"$d\"" unless $c eq 'help';
  }
}
with Cmd-Des.parsefile('p4-help.txt', :args((3,1,3)), actions => P4-actions.new).made {
  $p4fc.say: 'set -l p4c_help ' ~ .keys.join(' ') ~ "\n";
  for .kv -> $c, $d {
    $p4fc.say: 'complete -f -c p4 -n "__fish_seen_subcommand_from help; and not __fish_contains_opt $p4c_help" -a ' ~ "$c -d '$d'";
  }
}
=begin pod
=end pod
$p4fc.close;
#.say for 'p4-completion.fish'.IO.lines.grep( {@($_ ~~ m:g/ \' / ).elems > 2} );
#.say for 'p4-completion.fish'.IO.lines.grep( {$_ ~~ m:g/ help / } ).elems;
run <wc -l p4-completion.fish>