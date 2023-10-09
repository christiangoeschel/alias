# This is will output the exact amount of packages installed on your system
alias countpkg="rpm -qa | sort -fu | wc -l"

# Checking for package conflicts using rpm
pkgconflict() {
    # Printing conflicting package
    echo -e 'Checking for conflicting packages with "$1"'
    echo -e 'Conflicting package $(rpm -q --whatconflicts "$1")\nPackage file(s) state:\n'
    # Checking whether the conflicting package files are installed
    rpm -q --state $(rpm -q --whatconflicts "$1")
    
}
