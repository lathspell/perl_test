#!/usr/bin/perl
#
# http://search.cpan.org/~bnegrao/Net-SSH-Expect-1.09/lib/Net/SSH/Expect.pod
#
# => looks ok
#
use strict;
use warnings;
use Data::Dumper;
use Net::SSH::Expect; # Version l

my $host = 'localhost';
my $user = 'chammers';
my $pass = <STDIN>;
my $cmd  = 'id';

# login
my $ssh = Net::SSH::Expect->new(
    host     => $host,
    password => $pass,
    user     => $user,
    raw_pty  => 1,
    log_stdout   => 0,
);
my $login_output = $ssh->login();
if ( $login_output !~ /Linux $host/ ) {
    die "Login has failed. Login output was $login_output";
}

# non-interactive command
my $stdout = $ssh->exec($cmd);
print("STDOUT: |$stdout|\n");

# interactive command
$ssh->send("calc");
$ssh->waitfor('; ', 1 ) or die "prompt '; ' not found after 1 second";
$ssh->send("2 * 3");
$ssh->waitfor('; ', 1) or die "prompt '; ' not found";
print("Result: ". $ssh->before() . "\n");

$ssh->close();
