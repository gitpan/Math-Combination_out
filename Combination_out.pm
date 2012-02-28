package Math::Combination_out;

use strict;
use warnings;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(combinations_without_repetition
                 combinations_with_repetition);
our $VERSION = '0.13';

sub combinations_without_repetition {
    my ($ref_words, $k) = @_;
    my $n = requirements(@_);
    return if not defined $n;
    my $count = 0;
    my $ret_all = ();
    my ($i, @out_num);
    for($i = 0; $i < $k; $i++) {
        $out_num[$i] = $i;
    }
    $count++;
    $ret_all .= add_arr_comb(\@out_num, $count, $k, $ref_words);
    while() {
        $i = $k - 1;
        while($i >= 0 && $out_num[$i] == $n - $k + $i) {
            $i--;
        }
        if($i < 0) {
            return $ret_all;
        }
        $out_num[$i]++;
        for($i += 1; $i < $k; $i++) {
            $out_num[$i] = $out_num[$i - 1] + 1;
        }
        $count++;
        $ret_all .= add_arr_comb(\@out_num, $count, $k, $ref_words);
    }
}

sub combinations_with_repetition {
    my ($ref_words, $k) = @_;
    my $n = requirements(@_);
    return if not defined $n;
    my $count = 0;
    my $ret_all = ();
    my ($i, @out_num);
    for($i = 0; $i < $k; $i++) {
        $out_num[$i] = 0;
    }
    $count++;
    $ret_all .= add_arr_comb(\@out_num, $count, $k, $ref_words);
    while() {
        $i = $k - 1;
        while($i >= 0 && $out_num[$i] == $n - 1) {
            $i--;
        }
        if($i < 0) {
            return $ret_all;
        }
        $out_num[$i]++;
        for($i += 1; $i < $k; $i++) {
            $out_num[$i] = $out_num[$i - 1];
        }
        $count++;
        $ret_all .= add_arr_comb(\@out_num, $count, $k, $ref_words);
    }
}

sub requirements {
    my ($ref_words, $k) = @_;
    my $n = $#$ref_words + 1;
    if ($k <= 0 or $k > $n) {
        print "Requirements:\n";
        print "k - integer, k > 0\n";
        print "k < or = size of array\n";
        print "Quit\n";
        return;
    } else {
        return $n;
    }
}

sub add_arr_comb {
    my ($ref_out_num, $count, $k, $ref_words) = @_;
    my $ret = ();
    $ret .= "($count) ";
    my $i;
    for($i = 0; $i < $k; $i++) {
        $ret .= "$ref_words->[$ref_out_num->[$i]] ";
    }
    $ret .= "\n";
    #print $ret; # view of continued progress
    return $ret;
}

1;

__END__

=head1 NAME

Math::Combination_out - Combinations without/with repetition

=head1 SYNOPSIS

    use Math::Combination_out;

    {
    # array for combinatorics
    my @words = qw/a1 b2 c3 d4 e5 f6/;

    # length for combinatorics
    my $k = 4;

    print "---Combinations without repetition---\n\n";
    print combinations_without_repetition(\@words, $k);
    print "\n";
    }

    {
    # array for combinatorics
    my @words = qw/a1 b2 c3/;

    # length for combinatorics
    my $k = 3;

    print "---Combinations with repetition---\n\n";
    print combinations_with_repetition(\@words, $k);
    }

    Output:
    -------

    ---Combinations without repetition---

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

    ---Combinations with repetition---

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

Math::Combination_out - Combinations without/with repetition

The number of combinations without repetition: n! / ((n - k)! * k!);
The number of combinations with repetition: (n + k - 1)! / (k! * (n - 1)!)

=head1 EXPORT

combinations_without_repetition,
combinations_with_repetition

The result is a string, equal to the full output

=head1 AUTHOR

Petar Kaleychev <petar.kaleychev@gmail.com>

=head1 BUGS

Report them to the author

=head1 REFERENCES

Siegfried Koepf, Fast Combinatorial Algorithms in C,
http://www.aconnect.de/friends/editions/computer/combinatoricode_e.html

=head1 SEE ALSO

L<Math::Combinatorics>,
L<Algorithm::Combinatorics>

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
