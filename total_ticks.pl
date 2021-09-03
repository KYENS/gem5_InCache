#!/usr/bin/perl
use strict;
open(F1,'<','m5out/stats.txt') or die $!;

my @sim_ticks;
my $total_ticks=0;
while(<F1>){
	if( $_ =~ m/sim_ticks\s*\d*/ ){
		if($& =~ m/\d+/){	
			#			print $&,"\n";
			$total_ticks += $&;
		}
	}
}

print "Total ticks = ",$total_ticks,"\n";
