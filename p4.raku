my $p4hc = q:to/END/;

    Perforce client commands:

        add          Open a new file to add it to the depot
        aliases      Display the content of the P4ALIASES file
        annotate     Print file lines along with their revisions
        attribute    Set per-revision attributes on revisions
        branch       Create or edit a branch specification
        branches     Display list of branches
        change       Create or edit a changelist description
        changes      Display list of pending and submitted changelists
        changelist   Create or edit a changelist description
        changelists  Display list of pending and submitted changelists
        clean        Delete or refresh local files to match depot state
        client       Create or edit a client specification and its view
        clients      Display list of known clients
        copy         Schedule copy of latest rev from one file to another
        counter      Display, set, or delete a counter
        counters     Display list of known counters
        cstat        Dump change/sync status for current client
        delete       Open an existing file to delete it from the depot
        depot        Create or edit a depot specification
        depots       Display list of depots
        describe     Display a changelist description
        diff         Display diff of client file with depot file
        diff2        Display diff of two depot files
        dirs         List subdirectories of a given depot directory
        edit         Open an existing file for edit
        filelog      List revision history of files
        files        List files in the depot
        fix          Mark jobs as being fixed by named changelists
        fixes        List what changelists fix what job
        flush        Fake a 'p4 sync' by not moving files
        fstat        Dump file info
        grep         Print lines from text files matching a pattern
        group        Change members of a user group
        groups       List groups (of users)
        have         List revisions last synced
        help         Print the requested help message
        ignores      List P4IGNORE mappings
        info         Print out client/server information
        integrate    Schedule integration from one file to another
        integrated   Show integrations that have been submitted
        interchanges Report changes that have not yet been integrated
        istat        Show integrations needed for a stream
        job          Create or edit a job (defect) specification
        jobs         Display list of jobs
        key          Display, set, or delete a key/value pair
        keys         Display list of known keys and their values
        label        Create or edit a label specification and its view
        labels       Display list of labels
        labelsync    Synchronize label with the current client contents
        list         Create an in-memory (label) list of depot files
        lock         Lock an opened file against changelist submission
        logger       Report what jobs and changelists have changed
        login        Login to Perforce by obtaining a session ticket
        login2       Perform a multi factor authentication
        logout       Logout of Perforce by removing or invalidating a ticket
        merge        Schedule merge (integration) from one file to another
        move         Moves files from one location to another
        opened       Display list of files opened for pending changelist
        passwd       Set the user's password on the server (and Windows client)
        populate     Populate a branch or stream with files
        print        Retrieve a depot file to the standard output
        protect      Modify protections in the server namespace
        protects     Display protections in place for a given user/path
        prune        Remove unmodified branched files from a stream
        rec          Reconcile client to offline workspace changes
        reconcile    Reconcile client to offline workspace changes
        rename       Moves files from one location to another
        reopen       Change the type or changelist number of an opened file
        repo         Create, edit or delete a repo specification
        repos        Display a list of repos (depots of type graph)
        reshelve     Copy shelved files to a new or existing shelf
        resolve      Merge open files with other revisions or files
        resolved     Show files that have been merged but not submitted
        revert       Discard changes from an opened file
        review       List and track changelists (for the review daemon)
        reviews      Show what users are subscribed to review files
        set          Set variables in the registry (Windows only)
        shelve       Store files from a pending changelist into the depot
        status       Preview reconcile of client to offline workspace changes
        sizes        Display size information for files in the depot
        stream       Create or edit a stream specification
        streams      Display list of streams
        submit       Submit open files to the depot
        switch       Switch to a different stream, or create a new stream.
        sync         Synchronize the client with its view of the depot
        tag          Tag files with a label
        tickets      Display list of session tickets for this user
        trust        Establish trust of an SSL connection
        undo         Undo a range of revisions
        unlock       Release a locked file but leave it open
        unshelve     Restore shelved files from a pending changelist
        update       Update the client with its view of the depot
        user         Create or edit a user specification
        users        Display list of known users
        where        Show how file names map through the client view
        workspace    Create or edit a client specification and its view
        workspaces   Display list of known clients

    See 'p4 help administration' for more information about additional
    commands and issues of interest to those who are administering and
    operating the server.

    See 'p4 help dvcs' for more information about additional commands and
    topics of interest to those who use using Perforce with decentralized
    workflows.

END

grammar P4-help-commands {
    rule TOP { <.ws> 'Perforce client commands:' <.ws> <cnd>+ .* 
      { 
        my %fcp = %($/<cnd>.map: { .made });
        my $fc = 'set -l p4_client_commands ' ~ %fcp.keys.join(' ');
        $fc = "$fc\n" ~ 'complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a $p4_client_commands';
        for %fcp.kv -> $c, $d {
          $fc = "$fc\n" ~ 'complete -f -c p4 -n "not __fish_seen_subcommand_from $p4_client_commands" -a ' ~ "$c -d '$d'";
        }
        $fc.say;
        make %fcp;
      }
    }
    token cnd { <.ws> <cmd> <.ws> <des> <.ws> { make $/<cmd>.made => $/<des>.made } }
    token cmd { \w+ { make ~$/ } }
    token des {  <[A..Z]> \S+ [ \s \S+ ]+ { make ~$/ } }
}

my $m = P4-help-commands.parse($p4hc);
#say $m.made.keys.sort;
