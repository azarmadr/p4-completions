#use Grammar::Tracer;
grammar Cmd-Des {
  token TOP {
    <inf>+ <cd>+ <inf>+ \n
    { make %($/<cd>.map: { .made }) }
  }
  token cd { <id>**2 <cmd> \s+ <des> $$ { make $/<cmd>.made => $/<des>.made } }
  token inf { <id> <des> [\s**2 <des>]? }
  token des {  \S+ [ \s \S+ ]* { make $/.Str } }
  token cmd { <.ex>? \w+ { make ~$/.words[*-1] } }
  token ex  { 'p4 help' <.ws> }
  token id { \n* \s**4 }
}
=begin pod
class P4-actions {
  method TOP ($/) 
}
, actions => P4-actions.new
, actions => P4-actions.new
=end pod
#my $tem = P4C-help.parsefile('p4-help.txt');
#my $__fish = 1 ?? '__fish_contains_opt' !! '__fish_seen_subcommand_from';
# Parsing and creating fish completion's

my $p4fc = open 'p4-completion.fish', :w;
with Cmd-Des.parsefile('p4-help-cmds.txt').made {
  # `p4 help commands`
  .keys.sort.say;
  $p4fc.say: $('set -l p4_client_commands ' ~ .keys.join(' ') ~ "\n").subst(' help','');
  $p4fc.say: 'complete -f -c p4 -n "not __fish_seen_subcommand_from help" -a help -d "Print the requested help message"';
  for .kv -> $c, $d {
    $p4fc.say: 'complete -f -c p4 -n "__fish_seen_subcommand_from help; or not __fish_seen_subcommand_from $p4_client_commands" -a ' ~ "$c -d \"$d\"" unless $c eq 'help';
  }
}
with Cmd-Des.parsefile('p4-help.txt').made {
  # `p4 help`
  #.keys.elems.say;
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