# @(#)  $Id: memory_summary.sh,v 6.10.1.1 2013-09-12 16:13:15 ralph Exp $ 
# ---------------------------------------------------------------------------
# (c) 2013 by Ralph Roth - http://rose.rult.at


UNIX95= ps -e -o 'vsz pid ruser cpu time args' | awk '
{ a[$6]+=$1; total ++; memory += $1;}

END {
    for (i in a) if (a[i]>0) printf("%14ld \t %s\n", a[i], i);
    printf("----- %ld total processes\n", total);
    printf("----- %ld bytes, %03.2f GB total memory used\n", memory, memory/1024/1024);

}'|sort -nr

