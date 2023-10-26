# Useful functions for a smoother system administration

# Checking for package conflicts using rpm

pkgconflict() {

    # Printing conflicting package(s)
    echo -e 'Checking for conflicting package(s) with "$1"'
    echo -e 'Conflicting package(s) $(rpm -q --whatconflicts "$1")\nPackage file(s) state:\n'

    # Checking whether the conflicting package(s) file(s) are installed
    rpm -q --state $(rpm -q --whatconflicts "$1")

}

# A lot of terminals still do not support colors and therefore it can be a little tedious to manually check
# a given items file type.
# The -F option for the 'ls' command will append the following symbols to the corresponding file types:
#
# /        directories
# @        symbolic links
# *        executables
# |        FIFOs ( a.k.a named pipes )
# =        sockets
# >        doors ( currently only implemented on Solaris )
# none     regular file
function l(){

        echo -e '[ Linux file types suffix list ]\n\n"/" - directories, "@" - symbolic links, "*" - executables,'
        echo -e '"|" - FIFOs (named pipes), "=" - sockets, ">" - doors, no suffix means it is a regular file\n\n'

        ls -F $1

}

# This will clear your systems known_hosts file
# The known_hosts file stores the ssh public keys of the hosts accessed by a user.
#
# The syntax for this function is "clear_hostkey [IP] [known_host file path]"
function clear_hostkey(){

    cat .ssh/known_hosts | sed -e '/^{$1}' > $2"

}


# Function to follow a binaries complete link path (if it exists)
function showlink(){
    readlink -f $(which $1)
}

# Function that shows the last 'n' working directories you were in
function lpath(){


cat current_hisotry.txt | awk -F "  " '{ print $2 }'

}


# Write a specified users history to your current user's history file or history buffer
function importhist(){


}


# A function to search for the SSH port on a host
function searchssh(){

ip = $1

# For loop to iterate through port range
nc -v $ip $port

}
