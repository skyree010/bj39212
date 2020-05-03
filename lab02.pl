#!/usr/bin/perl
use warnings;

print "Podaj nazwe pliku\n";
my $filename = <STDIN>;
open (my $fh, $filename) or die "Nie udalo sie otworzyc pliku\n";
use Cwd qw(cwd);
print cwd;
print "\n";
my $amount = 0;
my @sumofstart;
my @sumofend;
$hour = 0;
$minute = 0;

while(my $line = <$fh>){

	if($line =~ /DTSTART;TZID=Europe/){
		$line=~ /\d*[T](\d{2})(\d{2})/g;
		$hour = $1*60;
		$minute = $2;
		$sum = $hour+$minute;
		push(@sumofstart, $sum);
	}

	if($line =~ /DTEND;TZID=Europe/){
		$line=~ /\d*[T](\d{2})(\d{2})/g;
		$hour = $1*60;
		$minute = $2;
		$sum = $hour+$minute;
		push(@sumofend, $sum);
	}	
}
close($fh);

for(my $i =0;$i<scalar @sumofstart;$i++){
	my $lesson = int(($sumofend[$i] - $sumofstart[$i]) /45);
	$amount = $amount + $lesson;
}

my $hours = $amount;
print "Liczba godzin: $hours\n";
print "\n";


