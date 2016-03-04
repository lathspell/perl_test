#!/usr/bin/perl
#
# http://search.cpan.org/~salva/Net-OpenSSH-0.63_01/lib/Net/OpenSSH.pm
#
# [x] SFTP
# [x] IPv6
#
# => GOOD
#

use strict;
use warnings;

my $host    = $ENV{'host'};
my $port    = 22;
my $user    = $ENV{'user'};
my $pass    = $ENV{'pass'};
my $cmd     = $ENV{'cmd'};
my $timeout = 5 * 1000;

use Net::OpenSSH;

my $ssh = Net::OpenSSH->new($host, user => $user, password => $pass, port => $port);
$ssh->error and die "Couldn't establish SSH connection: " . $ssh->error;

my @output = $ssh->capture($cmd);
$ssh->error and die "remote command failed: " . $ssh->error;
printf("Output got %d lines:\n%s\n", $#output + 1, join("", @output));

my ($stdout, $stderr) = $ssh->capture2($cmd);
$ssh->error and die "remote command failed: " . $ssh->error;
print("Output got:\nSTDOUT:\n$stdout\nSTDERR:\n$stderr\n");