use Grammar::Tracer;
grammar Cmd-Des {
  token cd { <.ws> <cmd> \s+ <des> $$ { make $/<cmd>.made => $/<des>.made } }
  token des {  \S+ [ \s \S+ ]* { make $/.Str } }
  token cmd { <.ex>? \w+ { make ~$/.words[*-1] } }
  token ex  { 'p4 help' <.ws> }# <.ws> <$kr> }
}
grammar P4-Cmds is Cmd-Des {
  # parsing `p4 help commands`
  token TOP { <.ws> <des> <.ws> <cd>+ .* }
}
grammar P4C-help is Cmd-Des {
  # parsing `p4 help`
  token TOP { [<.ws> <des>]**3 <.ws> <cd>+ .* }
}
class p4-actions {
  method TOP ($/) { make %($/<cd>.map: { .made }) }
}
my $tem = P4C-help.parsefile('p4-help.txt');

=begin pod
# Parsing and creating fish completion's
my %fcp = P4-Cmds.parsefile('p4-help-cmds.txt').made;
my $p4fc = open 'p4-completion.fish', :w;
$p4fc.say: 'set -l p4_client_commands ' ~ %fcp.keys.join(' ') ~ "\n";
$p4fc.say: 'complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a $p4_client_commands';
for %fcp.kv -> $c, $d {
  $p4fc.say: 'complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a ' ~ "$c -d '$d'";
}
$p4fc.close;
=end pod
#say slurp 'p4-completion.fish'