#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;

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
