=pod

=head1 NAME

Math::Combination_out - Prints combinations without repetitions

In this module was applied the approach for k-combinations without repetition in lexicographic order, 
presented in the ANSI-C code by Siegfried Koepf at:

http://www.aconnect.de/friends/editions/computer/combinatoricode_e.html

=head1 SYNOPSIS


use Math::Combination_out qw(:CMB);

BEGIN {
  use lib 'lib';
}

#array for combinatorics
my @words = qw/a1 b2 c3 d4 e5 f6/;

#length for combinatorics
my $k = 4;

push(@words, $k);

print Combinations(@words),"\n";


Result:

(1) a1 b2 c3 d4
(2) a1 b2 c3 e5
(3) a1 b2 c3 f6
(4) a1 b2 d4 e5
(5) a1 b2 d4 f6
(6) a1 b2 e5 f6
(7) a1 c3 d4 e5
(8) a1 c3 d4 f6
(9) a1 c3 e5 f6
(10) a1 d4 e5 f6
(11) b2 c3 d4 e5
(12) b2 c3 d4 f6
(13) b2 c3 e5 f6
(14) b2 d4 e5 f6
(15) c3 d4 e5 f6


=head1 DESCRIPTION

Math::Combination_out - Simple module to prints combinations without repetitions.

=head1 AUTHOR

Petar Kaleychev <petar.kaleychev@gmail.com>

=head1 BUGS

Report them to the author.

=head1 COPYRIGHT

Copyright (c) 2011 Petar Kaleychev. All rights reserved. This program is free software; you
can redistribute it and/or modify it under the same terms as Perl itself.

=cut

package Math::Combination_out;

use strict;
use warnings;
use diagnostics;
use Exporter;

our $VERSION     = 0.01;
our @ISA         = qw(Exporter);
our @EXPORT      = ();
our @EXPORT_OK   = qw(Combinations);
our %EXPORT_TAGS = ( CMB => [qw(&Combinations)]);

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

sub Combinations
{

sub requirements
{
print "Requirements:\n";	
print "k > 0\n";
print "k < or = size of array\n";
print "Quit\n";
exit;	
}

our @words = @_;

our $k = pop(@words);

my $len_words = $#words;
my $n = $len_words + 1;

if (($k <= 0) or ($n == 0) or ($k > $n))
{
&requirements;	
}

our @arr_comb;
sub print_arr_comb
{
my $i;
my $out_num;
for($i = 0; $i < $k; $i++)
 {
 $out_num = $arr_comb[$i];
 print "$words[$out_num] ";
 }
print "\n";	
}

my $count = 0;
my $i;
for($i = 0; $i < $k; $i++) 
 {
 $arr_comb[$i] = $i;
 }

$count++;

print "($count) ";
&print_arr_comb;

while()
{

while($arr_comb[$k - 1] < $n - 1)
 {
 $arr_comb[$k - 1]++;
 $count++;
 
 print "($count) ";
 &print_arr_comb;
 }
 
$i = $k - 1;
while($i >= 0 && $arr_comb[$i] == $n - $k + $i)
 {
  $i--;
 }

if($i < 0)
 {
 exit;
 } 

$arr_comb[$i]++;
 
for($i += 1; $i < $k; $i++)
 {
 $arr_comb[$i] = $arr_comb[$i - 1] + 1;
 }
$count++;

print "($count) ";
&print_arr_comb;
  
}
}

1;
