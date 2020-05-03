#!/usr/bin/perl
use strict;
use warnings;

use Cwd qw(cwd);
my $dir = shift || cwd;


print "$dir \n\n";
opendir (my $dh, $dir || die "Can't opendir $dir: $!");

my @list = readdir($dh);
my @sortedlist = sort {lc($a) cmp lc($b)} @list;


foreach my $thing(@sortedlist){
	if($thing eq '.' or $thing eq '..' or $thing =~ /\d*[~]/){
		next;
	}
	print "$thing\n";
}

closedir $dh;
