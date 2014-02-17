package Math::Combination_out;

use strict;
use Carp;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(combinations_without_repetition
                 combinations_with_repetition);

our $VERSION = '0.17';

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
        while($out_num[$i] == $n - $k + $i) {
            $i--;
        }
        return $ret_all if $i < 0;
        $out_num[$i]++;
        for($i++; $i < $k; $i++) {
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
        while($out_num[$i] == $n - 1) {
            $i--;
        }
        return $ret_all if $i < 0;
        $out_num[$i]++;
        for($i++; $i < $k; $i++) {
            $out_num[$i] = $out_num[$i - 1];
        }
        $count++;
        $ret_all .= add_arr_comb(\@out_num, $count, $k, $ref_words);
    }
}

sub requirements {
    my ($ref_words, $k) = @_;
    my $n = scalar @$ref_words;
    if ($k <= 0 or $k > $n) {
        print "Requirements:\n";
        print "k - integer, k > 0\n";
        print "k < or = size of array\n";
        print "Quit\n";
        return;
    } else {
        $n;
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
    return $ret .= "\n";
}

sub new {
    my ($class, $in) = @_;
    defined $in || croak 'Undefined input';
    my @in = split(/\n/, $in);
    bless \@in, $class;
    return \@in;
}

sub num_rem {
    my $foo = shift;
    my $out = ();
    foreach (@$foo) {
        $_ =~ s/^\(\d+\) //g;
        $out .= $_."\n";
    }
    $out;
}

sub match {
    my ($foo, $patt) = @_;
    defined $patt || croak 'Undefined pattern';
    my $out = ();
    foreach (@$foo) {
        $out .= $_."\n" if $_ =~ /$patt/;
    }
    defined $out ? return $out : print 'Without matching', "\n";
    return;
}

sub match_no {
    my ($foo, $patt) = @_;
    defined $patt || croak 'Undefined pattern';
    my $out = ();
    foreach (@$foo) {
        $out .= $_."\n" unless $_ =~ /$patt/;
    }
    defined $out ? return $out : print 'Without no matching', "\n";
    return;
}

sub subt {
    my ($foo, $patt, $subt) = @_;
    defined $subt || croak 'Undefined substitution input';
    my $out = ();
    foreach (@$foo) {
        $_ =~ s/$patt/$subt/g;
        $out .= $_."\n";
    }
    $out;
}

1;

__END__

=head1 NAME

Math::Combination_out - Combinations without/with repetition and selection

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

    ---

    For selection of combinations:

    my $out = Math::Combination_out->new(combinations_without_repetition(\@words, $k));

    print $out->num_rem(), "\n"; # removing the numbers before combinations
    
    Output:
    a1 b2 c3 d4
    a1 b2 c3 e5
    a1 b2 c3 f6
    a1 b2 d4 e5
    a1 b2 d4 f6
    a1 b2 e5 f6
    a1 c3 d4 e5
    a1 c3 d4 f6
    a1 c3 e5 f6
    a1 d4 e5 f6
    b2 c3 d4 e5
    b2 c3 d4 f6
    b2 c3 e5 f6
    b2 d4 e5 f6
    c3 d4 e5 f6

    print $out->match('f6'), "\n"; # matching

    Output:
    (3) a1 b2 c3 f6
    (5) a1 b2 d4 f6
    (6) a1 b2 e5 f6
    (8) a1 c3 d4 f6
    (9) a1 c3 e5 f6
    (10) a1 d4 e5 f6
    (12) b2 c3 d4 f6
    (13) b2 c3 e5 f6
    (14) b2 d4 e5 f6
    (15) c3 d4 e5 f6

    print $out->match('d4 f6'), "\n";

    Output:
    (5) a1 b2 d4 f6
    (8) a1 c3 d4 f6
    (12) b2 c3 d4 f6

    print $out->match('^\(3\)'), "\n";

    Output:
    (3) a1 b2 c3 f6

    print $out->match('e5 $'), "\n";

    Output:
    (2) a1 b2 c3 e5
    (4) a1 b2 d4 e5
    (7) a1 c3 d4 e5
    (11) b2 c3 d4 e5

    print $out->match_no('f6'), "\n"; # no matching

    Output:
    (1) a1 b2 c3 d4
    (2) a1 b2 c3 e5
    (4) a1 b2 d4 e5
    (7) a1 c3 d4 e5
    (11) b2 c3 d4 e5

    print $out->subt('e5 ', 'NEW '), "\n"; # substitute

    Output:
    (1) a1 b2 c3 d4
    (2) a1 b2 c3 NEW
    (3) a1 b2 c3 f6
    (4) a1 b2 d4 NEW
    (5) a1 b2 d4 f6
    (6) a1 b2 NEW f6
    (7) a1 c3 d4 NEW
    (8) a1 c3 d4 f6
    (9) a1 c3 NEW f6
    (10) a1 d4 NEW f6
    (11) b2 c3 d4 NEW
    (12) b2 c3 d4 f6
    (13) b2 c3 NEW f6
    (14) b2 d4 NEW f6
    (15) c3 d4 NEW f6

    print $out->subt('e5 $', 'NEW '), "\n";

    Output:
    (1) a1 b2 c3 d4
    (2) a1 b2 c3 NEW
    (3) a1 b2 c3 f6
    (4) a1 b2 d4 NEW
    (5) a1 b2 d4 f6
    (6) a1 b2 e5 f6
    (7) a1 c3 d4 NEW
    (8) a1 c3 d4 f6
    (9) a1 c3 e5 f6
    (10) a1 d4 e5 f6
    (11) b2 c3 d4 NEW
    (12) b2 c3 d4 f6
    (13) b2 c3 e5 f6
    (14) b2 d4 e5 f6
    (15) c3 d4 e5 f6

=head1 DESCRIPTION

Math::Combination_out - Combinations without/with repetition and selection

=head1 EXPORT

combinations_without_repetition,
combinations_with_repetition

=head1 AUTHOR

Petar Kaleychev <petar.kaleychev@gmail.com>

=head1 BUGS

Report them to the author

=head1 REFERENCES

Siegfried Koepf, Fast Combinatorial Algorithms in C,
http://www.aconnect.de/friends/editions/computer/combinatoricode_e.html

=head1 SEE ALSO

L<Math::Counting>,
L<Math::Subsets::List>,
L<Math::Combinatorics>,
L<Algorithm::Combinatorics>

=head1 COPYRIGHT

Copyright (c) 2014 Petar Kaleychev

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
