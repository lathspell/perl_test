#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Std;

$Getopt::Std::OUTPUT_HELP_VERSION = 1;

our($opt_h, $opt_n);
getopts('hn:');

printf("h=$opt_h; n=$opt_n\n");
