#!/usr/bin/perl
print "Podaj nazwe pliku\n";
$filename = <STDIN>;
print "Nazwa pliku to $filename\n";
open ($fh, $filename) or die "Nie udalo sie otwozyc pliku\n";

@strings = <$fh>;
my @names;
my @scores;

open($fh2,">","outfile.csv") or die "Nie udalo się stworzyc pliku\n";
print $fh2 "IMIĘ,\t SUMA\n";

foreach $line (@strings) {
	if($line =~ /headerrow/)
		{
			@names = ($line =~ /<a href=".*?WIPING5\/users.*?">([^>]*?)<\/a>/g);
			@scores = ($line =~ /<td class.*?>([^>]*?)<\/td><\/tr>/g);
		}
	}
for($i=0;$i<scalar @names;$i++)
	{
		print $fh2 "\"@names[$i]\", \"@scores[$i]\"\n";
	}

close $fh;
close $fh2;




