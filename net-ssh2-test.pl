#!/usr/bin/perl
#
# http://search.cpan.org/~rkitover/Net-SSH2-0.53/lib/Net/SSH2.pm
# http://search.cpan.org/~rkitover/Net-SSH2-0.53/lib/Net/SSH2/Channel.pm
#
# => looks working
#
use strict;
use warnings;
use Data::Dumper;
use Net::SSH2;

my $host = $ENV{'host'};
my $port = 22;
my $user = $ENV{'user'};
my $pass = $ENV{'pass'};
my $cmd  = $ENV{'cmd'};
my $timeout = 5*1000;

print("Connecting as $user on $host\n");

my $ssh2 = Net::SSH2->new();
$ssh2->debug(1);
$ssh2->connect($host, $port, timeout => $timeout) or die $!;
print("Connected ($ssh2)\n");
if ( ! $ssh2->auth_password($user, $pass)) {
    die("Auth failed!");
}
my $chan = $ssh2->channel();
print("Opened channe ($chan)\n");
$chan->exec($cmd);
print("Exec successfull\n");

my $output;
$chan->read($output, 255);

print("Output: $output\n");
$chan->close();

# my $sftp = $ssh2->sftp();
# my $fh = $sftp->open('/etc/passwd') or die;
# print $_ while <$fh>;

$ssh2->disconnect();
