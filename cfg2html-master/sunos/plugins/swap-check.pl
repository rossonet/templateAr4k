#!/bin/sh -- # Really perl
eval 'exec perl -S $0 ${1+"$@"} 2>/dev/null'
  if 0;

# Designed by:  Dusan U. Baljevic (dusan.baljevic@ieee.org)
# Coded by:     Dusan U. Baljevic (dusan.baljevic@ieee.org)

use strict;

$ENV{'PATH'} = "/usr/bin:/usr/sbin:/sbin:/bin:/usr/ccs/bin:/etc";

my @SWAPSARR  = ();
my $SWAPUA    = q{};
my $tswapused = q{};
my $tswap1    = q{};
my $tswap     = q{};

if ( open( MX, "swap -l | nawk '! /swapfile/ && ! /awk/ {print}' |" ) ) {
   while (<MX>) {
      chomp;
      ( undef, undef, undef, $tswapused, undef ) = split( /\s+/, $_ );
      $tswap1 += $tswapused;
   }
   close(MX);
}

my $tswap = int( $tswap1 / ( 2 * 1024 ) );

print "Total disk-based swap space is $tswap MB (physical paging devices, and file-systems)\n";

if ( open( MX3, "swap -s |" ) ) {
   while (<MX3>) {
      chomp;
      @SWAPSARR = split( /\s+/, $_ );
      $SWAPSARR[1] =~ s/^\s+//g;
      $SWAPSARR[1] =~ s/\s+$//g;
      $SWAPSARR[1] =~ s/k$//g;
      $SWAPSARR[$#SWAPSARR - 1] =~ s/^\s+//g;
      $SWAPSARR[$#SWAPSARR - 1] =~ s/\s+$//g;
      $SWAPSARR[$#SWAPSARR - 1] =~ s/k$//g;
      #
      # Swap used plus available
      $SWAPUA = int(( $SWAPSARR[1] / 1024) + ( $SWAPSARR[$#SWAPSARR - 1] / 1024));
   }
   close(MX3);
}

print "\nSwap used plus available is $SWAPUA MB, of which $tswap MB is disk-based\n";

exit(0);
