#!/usr/bin/perl
#
# http://search.cpan.org/~salva/Net-OpenSSH-Compat-0.06/lib/Net/OpenSSH/Compat/Perl.pm
#
# => looks promising but seems to miss parts of the output if the command takes
#    a while (like e.g. ping on a Cisco router)!
#

use strict;

use Net::OpenSSH::Compat::Perl qw(:supplant);
use Net::SSH::Perl;

my $host = $ENV{'host'};
my $port = 22;
my $user = $ENV{'user'};
my $pass = $ENV{'pass'};
my $cmd  = $ENV{'cmd'};
my $timeout = 5*1000;

my $ssh = Net::SSH::Perl->new($host, port=>$port, options => [ "BatchMode yes" ]);
$ssh->login($user, $pass);
my ($out, $err, $rc) = $ssh->cmd($cmd);

print("out=|$out|\nerr=|$err|\nrc=|$rc|\n");