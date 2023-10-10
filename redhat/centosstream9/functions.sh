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
