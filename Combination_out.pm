package Math::Combination_out;

use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw(Combination_out) ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw(Combinations);
our $VERSION = '0.04';

sub Combinations
{

sub requirements
{
print "Requirements:\n";
print "k - integer\n";
print "k > 0\n";
print "k < or = size of array\n";
print "opt = 1 or opt = 2\n";
print "Quit\n";
exit;	
}

our @words = @_;

our $opt = pop(@words);
our $k = pop(@words);

my $len_words = $#words;
my $n = $len_words + 1;

if (($k <= 0) or ($n == 0) or ($k > $n))
{
&requirements;	
}

if (($opt!= 1) and ($opt!= 2))
{
&requirements;	
}

our @arr_comb;
our $count = 0;

sub print_arr_comb
{
my $i;
my $out_num;

my $ret = "";
$ret .= "($count) ";
 for($i = 0; $i < $k; $i++)
 {
 $out_num = $arr_comb[$i];
 $ret .= "$words[$out_num] ";
 }
$ret .= "\n";

return $ret;
}

my $i;
if($opt == 1)
{
 for($i = 0; $i < $k; $i++) 
 {
 $arr_comb[$i] = $i;
 }
}
if($opt == 2)
{
 for($i = 0; $i < $k; $i++) 
 {
 $arr_comb[$i] = 0;
 }
}  
$count++;

our $ret_all = "";
$ret_all .= &print_arr_comb;

while()
{

if($opt == 1)
{
 while($arr_comb[$k - 1] < $n - 1)
 {
 $arr_comb[$k - 1]++;
 $count++;
 $ret_all .= &print_arr_comb;
 }
}

$i = $k - 1;
if($opt == 1)
{ 
 while($i >= 0 && $arr_comb[$i] == $n - $k + $i)
 {
  $i--;
 }
}
if($opt == 2)
{ 
 while($i >= 0 && $arr_comb[$i] == $n - 1)
 {
  $i--;
 }
}

if($i < 0)
 {
 return $ret_all;
 exit;
 } 

$arr_comb[$i]++;

if($opt == 1)
{  
 for($i += 1; $i < $k; $i++)
 {
 $arr_comb[$i] = $arr_comb[$i - 1] + 1;
 }
$count++;
}

if($opt == 2)
{  
 for($i += 1; $i < $k; $i++)
 {
 $arr_comb[$i] = $arr_comb[$i - 1];
 }
$count++;
}

$ret_all .= &print_arr_comb;

}
}

1;

=pod

=head1 NAME

Math::Combination_out - Combinations without or with repetition

In this module was applied the approach for k-combinations without and with repetition in lexicographic order, 
presented in the ANSI-C code by Siegfried Koepf at:

http://www.aconnect.de/friends/editions/computer/combinatoricode_e.html

=head1 SYNOPSIS

EXAMPLE:

use Math::Combination_out;

{my @words = qw/a1 b2 c3 d4 e5 f6/; #array for combinatorics
my $k = 4; #length for combinatorics, use only integer!
my $opt = 1; #option: 1 - without repetition

push(@words, $k, $opt);

print Combinations(@words),"\n"}

{my @words = qw/a1 b2 c3/; #array for combinatorics

my $k = 3; #length for combinatorics, use only integer!
my $opt = 2; #option: 2 - with repetition

push(@words, $k, $opt);

print Combinations(@words),"\n";}

Result:

(Combinations without repetition):

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

(Combinations with repetition):

(1) a1 a1 a1
(2) a1 a1 b2
(3) a1 a1 c3
(4) a1 b2 b2
(5) a1 b2 c3
(6) a1 c3 c3
(7) b2 b2 b2
(8) b2 b2 c3
(9) b2 c3 c3
(10) c3 c3 c3

=head1 DESCRIPTION

Math::Combination_out - Combinations without or with repetition

=head1 AUTHOR

Petar Kaleychev <petar.kaleychev@gmail.com>

=head1 BUGS

Report them to the author.

=head1 COPYRIGHT

Copyright (c) 2011 Petar Kaleychev

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

=cut
