set -l p4_client_commands filelog help changelists merge trust reviews attribute review flush revert where status files jobs protect users opened unshelve undo sizes diff integrated branch cstat change label switch diff2 groups fixes describe changes aliases resolve tickets tag depots integrate rec move reconcile list unlock sync protects keys reopen interchanges changelist logout user copy ignores add depot counter annotate login repos lock stream populate repo resolved shelve clients info job group fix branches counters rename key prune grep have dirs labels fstat labelsync set login2 reshelve client clean passwd workspaces submit workspace streams print update delete edit logger istat
#complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a $p4_client_commands
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a filelog -d 'List revision history of files'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a help -d 'Print the requested help message'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a changelists -d 'Display list of pending and submitted changelists'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a merge -d 'Schedule merge (integration) from one file to another'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a trust -d 'Establish trust of an SSL connection'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a reviews -d 'Show what users are subscribed to review files'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a attribute -d 'Set per-revision attributes on revisions'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a review -d 'List and track changelists (for the review daemon)'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a flush -d 'Fake a 'p4 sync' by not moving files'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a revert -d 'Discard changes from an opened file'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a where -d 'Show how file names map through the client view'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a status -d 'Preview reconcile of client to offline workspace changes'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a files -d 'List files in the depot'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a jobs -d 'Display list of jobs'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a protect -d 'Modify protections in the server namespace'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a users -d 'Display list of known users'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a opened -d 'Display list of files opened for pending changelist'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a unshelve -d 'Restore shelved files from a pending changelist'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a undo -d 'Undo a range of revisions'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a sizes -d 'Display size information for files in the depot'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a diff -d 'Display diff of client file with depot file'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a integrated -d 'Show integrations that have been submitted'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a branch -d 'Create or edit a branch specification'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a cstat -d 'Dump change/sync status for current client'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a change -d 'Create or edit a changelist description'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a label -d 'Create or edit a label specification and its view'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a switch -d 'Switch to a different stream, or create a new stream.'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a diff2 -d 'Display diff of two depot files'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a groups -d 'List groups (of users)'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a fixes -d 'List what changelists fix what job'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a describe -d 'Display a changelist description'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a changes -d 'Display list of pending and submitted changelists'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a aliases -d 'Display the content of the P4ALIASES file'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a resolve -d 'Merge open files with other revisions or files'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a tickets -d 'Display list of session tickets for this user'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a tag -d 'Tag files with a label'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a depots -d 'Display list of depots'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a integrate -d 'Schedule integration from one file to another'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a rec -d 'Reconcile client to offline workspace changes'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a move -d 'Moves files from one location to another'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a reconcile -d 'Reconcile client to offline workspace changes'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a list -d 'Create an in-memory (label) list of depot files'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a unlock -d 'Release a locked file but leave it open'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a sync -d 'Synchronize the client with its view of the depot'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a protects -d 'Display protections in place for a given user/path'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a keys -d 'Display list of known keys and their values'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a reopen -d 'Change the type or changelist number of an opened file'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a interchanges -d 'Report changes that have not yet been integrated'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a changelist -d 'Create or edit a changelist description'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a logout -d 'Logout of Perforce by removing or invalidating a ticket'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a user -d 'Create or edit a user specification'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a copy -d 'Schedule copy of latest rev from one file to another'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a ignores -d 'List P4IGNORE mappings'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a add -d 'Open a new file to add it to the depot'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a depot -d 'Create or edit a depot specification'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a counter -d 'Display, set, or delete a counter'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a annotate -d 'Print file lines along with their revisions'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a login -d 'Login to Perforce by obtaining a session ticket'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a repos -d 'Display a list of repos (depots of type graph)'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a lock -d 'Lock an opened file against changelist submission'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a stream -d 'Create or edit a stream specification'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a populate -d 'Populate a branch or stream with files'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a repo -d 'Create, edit or delete a repo specification'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a resolved -d 'Show files that have been merged but not submitted'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a shelve -d 'Store files from a pending changelist into the depot'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a clients -d 'Display list of known clients'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a info -d 'Print out client/server information'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a job -d 'Create or edit a job (defect) specification'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a group -d 'Change members of a user group'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a fix -d 'Mark jobs as being fixed by named changelists'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a branches -d 'Display list of branches'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a counters -d 'Display list of known counters'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a rename -d 'Moves files from one location to another'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a key -d 'Display, set, or delete a key/value pair'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a prune -d 'Remove unmodified branched files from a stream'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a grep -d 'Print lines from text files matching a pattern'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a have -d 'List revisions last synced'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a dirs -d 'List subdirectories of a given depot directory'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a labels -d 'Display list of labels'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a fstat -d 'Dump file info'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a labelsync -d 'Synchronize label with the current client contents'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a set -d 'Set variables in the registry (Windows only)'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a login2 -d 'Perform a multi factor authentication'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a reshelve -d 'Copy shelved files to a new or existing shelf'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a client -d 'Create or edit a client specification and its view'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a clean -d 'Delete or refresh local files to match depot state'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a passwd -d 'Set the user's password on the server (and Windows client)'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a workspaces -d 'Display list of known clients'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a submit -d 'Submit open files to the depot'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a workspace -d 'Create or edit a client specification and its view'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a streams -d 'Display list of streams'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a print -d 'Retrieve a depot file to the standard output'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a update -d 'Update the client with its view of the depot'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a delete -d 'Open an existing file to delete it from the depot'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a edit -d 'Open an existing file for edit'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a logger -d 'Report what jobs and changelists have changed'
complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a istat -d 'Show integrations needed for a stream'
