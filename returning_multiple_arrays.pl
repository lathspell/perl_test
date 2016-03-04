#!/usr/bin/perl

use strict;
use warnings;

sub testfunc() {
    my @aa = (1,2,3);
    my @bb = (4,5,6);
    return (\@aa, \@bb);
}

my ($a_ref, $b_ref) = testfunc();
my @a = @$a_ref;
my @b = @$b_ref;

print("a=@a\n");
print("b=@b\n");

my @combined = (@a, @b);
print("combined a+b=@combined\n");
