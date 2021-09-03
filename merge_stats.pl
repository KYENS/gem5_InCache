#!/usr/bin/perl
use strict;

my $file="m5out/stats.txt";
open( FH,'<',$file) or die $!;
my  $array_idx = 1;
my  @array1_name;
my  @array1_entry;
my  @array1_desc;

my  @array2_name;
my  @array2_entry;
my  @array2_desc;
my  $start_flag=0;
while(<FH>){
    if( $_ =~ /Begin Simulation/  ){
	    print $_;
	    $start_flag = 1;
    }elsif( $_ =~ /End Simulation/  ){
	    print $_;
	    $array_idx += 1;
	    $start_flag = 0;
    }
    elsif( $_ =~ m/\s+\d+.?\d*\s+/ | $_ =~ m/nan/){
	    my $name = $`;
	    my $entry = $& + 0;
	    my $desc = $';
	    if( $start_flag eq 1 ){
		    if( $array_idx eq 1 ){
			    my $size1 = @array1_name;
			    print $size1;
			    push(@array1_name,$name);
			    push(@array1_entry,$entry);
			    push(@array1_desc,$desc);
		    }else{
			    my $size2 = @array2_name;
			    print $size2;
			    push(@array2_name,$name);
			    push(@array2_entry,$entry);
			    push(@array2_desc,$desc);
		    }
	    }	
	    print "$name== $entry == $desc";
	    
    }
}
my $size1 = @array1_name;
my $size2 = @array2_name;
my $array2_ptr=0;
print $size1,$size2;

for(my $i=0;$i<$size1;$i++){
    for(my $j=$array2_ptr + 1 ; $j<$size2; $j++){
        if($array1_name[$i] eq $array2_name[$j]){
	    $array2_ptr = $j ;
	    last;
	}	
    }
    print "\n";
    print $i,',',$array1_name[$i],' ',$array1_entry[$i],' ',$array1_desc[$i];
    print $j,',',$array2_name[$j],' ',$array2_entry[$j],' ',$array2_desc[$j];
}

close(FH);
print("aaa\n");
