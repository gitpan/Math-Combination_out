#!/usr/bin/perl

#Example1: Combinations without repetition

use strict;
use warnings;
use diagnostics;

use Math::Combination_out qw(:CMB);

BEGIN {
  use lib 'lib';
}

#array for combinatorics
my @words = qw/a1 b2 c3 d4 e5 f6/;

#length for combinatorics, use only integer!
my $k = 4;

#option: 1 - without repetition
my $opt = 1;

push(@words, $k);
push(@words, $opt);

print Combinations(@words),"\n";
