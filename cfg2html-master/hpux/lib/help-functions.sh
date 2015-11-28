function usage {
    echo ""
    echo "usage: cfg2html_hpux.sh [options]\ncreates a HTML and plain ASCII host documentation"
    echo "Output modifier:"
    echo "  -o path       directory to write (or use the environment variable)"
    echo "                OUTDIR=\"/path/to/dir\" (directory must exist)"
    echo "  -0 (null)     append the current date+time to the output files (D-M-Y-hhmm)"
    echo "  -1 (one)      append the current date to the output files (Day-Month-Year)"
    echo "  -2 modifier   like option -1, you can use date +modifier, e.g. -2%d%m"
    echo "                DO NOT use spaces for the filename, e.g. -2%c"
    echo "Help:"
    echo "  -v            output version information and exit"
    echo "  -h            display this help and exit"
    echo
    echo "use the following options to enable/disable collectors"
    echo "  -A            enable:  SAP collector (#)"
    echo "  -D            enable:  Debug, dumps settings to stdout"
    echo "  -F            disable: Fibre channel"
    echo "  -H            disable: Hardware"
    echo "  -L            disable: Screen tips inline"
    echo "  -S            disable: Software"
    echo "  -T            enable:  trace timings in output (txt, html and err)"
    echo "  -M            disable: Serviceguard and Quorum Server collector"
    echo "  -U            disable: User accounts/security sensitive data collection"
    echo "  -P            enable: cfg2html plugin architecture" # anaumann 2009/08/24
    echo
    echo "  -a            disable: Applications"
    ### echo "  -b            enable:  BCS_Config, external collector (#*)  (obsolete)"
    echo "  -c            disable: Cron"
    echo "  -d            disable: Diagnostics (cstm, obsolete since 03/2009 #)"
    echo "  -e            disable: Enhancements"
    echo "  -f            disable: File system"
    echo "  -k            disable: Kernel/Boot"
    echo "  -l            disable: LVM"
    echo "  -n            disable: Network"
    echo "  -s            disable: System"
    ### echo "  -t            enable:  TGV Volumegroup/LVM collector (#*)   (obsolete)"

    echo  "\n(#) these collectors create a lot of information!"
    echo  "(*) collector not included into this package!"
    echo  "Example:  /usr/sbin/cfg2html -AL -o /tmp/hp \t to collect EVERYTHING"
    echo  "A shell wrapper with handy options is included into this distribution, "
    echo  "simply try: cfg2html  (calls cfg2html_hpux.sh -o /var/log/cfg2html)"
}
