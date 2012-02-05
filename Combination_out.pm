package Math::Combination_out;

use strict;
use warnings;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(combinations);
our $VERSION = '0.06';

sub add_arr_comb;
sub combinations;
sub requirements;

my ($count, $i, $k, @words, $r);

sub combinations {
@words = @_;
$count = 0;
my $opt = pop(@words);
$k = pop(@words);
my $len_words = $#words;
my $n = $len_words + 1;
my $ret_all = "";

if (($k <= 0) or ($n == 0) or ($k > $n)) 
{requirements}

if (($opt!= 1) and ($opt!= 2))
{requirements}

if($opt == 1)
{
 for($i = 0; $i < $k; $i++) 
 {$r->[$i] = $i}
}
if($opt == 2)
{
 for($i = 0; $i < $k; $i++) 
 {$r->[$i] = 0}
}
$count++;

 sub add_arr_comb {
 my $ret = "";
 $ret .= "($count) ";

 for($i = 0; $i < $k; $i++)
 {$ret .= "$words[$r->[$i]] "}

 $ret .= "\n";
 return $ret;
 }

$ret_all .= add_arr_comb;

while()
{

if($opt == 1)
{
 while($r->[$k - 1] < $n - 1)
 {$r->[$k - 1]++;
 $count++;
 $ret_all .= add_arr_comb}
}

$i = $k - 1;
if($opt == 1)
{ 
 while($i >= 0 && $r->[$i] == $n - $k + $i)
 {$i--}
}
if($opt == 2)
{ 
 while($i >= 0 && $r->[$i] == $n - 1)
 {$i--}
}

if($i < 0)
{return $ret_all} 

$r->[$i]++;

if($opt == 1)
{  
 for($i += 1; $i < $k; $i++)
 {$r->[$i] = $r->[$i - 1] + 1}
$count++;
}

if($opt == 2)
{
 for($i += 1; $i < $k; $i++)
 {$r->[$i] = $r->[$i - 1]}
$count++;
}

$ret_all .= add_arr_comb;

}
}

sub requirements {
print "Requirements:\n";
print "k - integer\n";
print "k > 0\n";
print "k < or = size of array\n";
print "opt = 1 or opt = 2\n";
print "Quit\n";
exit(1);
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

print combinations(@words),"\n"}

{my @words = qw/a1 b2 c3/; #array for combinatorics

my $k = 3; #length for combinatorics, use only integer!
my $opt = 2; #option: 2 - with repetition

push(@words, $k, $opt);

print combinations(@words),"\n"}

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

Report them to the author

=head1 COPYRIGHT

Copyright (c) 2011-2012 Petar Kaleychev

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
