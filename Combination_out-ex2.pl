#!/usr/bin/perl

#Example2: Combinations with repetition

use strict;
use warnings;
use diagnostics;

use Math::Combination_out qw(:CMB);

BEGIN {
  use lib 'lib';
}

#array for combinatorics
my @words = qw/a1 b2 c3/;

#length for combinatorics, use only integer!
my $k = 3;

#option: 2 - with repetition
my $opt = 2;

push(@words, $k);
push(@words, $opt);

print Combinations(@words),"\n";
