#!/usr/bin/perl
#
# http://search.cpan.org/~oliver/Net-Appliance-Session-4.131260/lib/Net/Appliance/Session.pm
#
# Cookbook:
#   http://search.cpan.org/~oliver/Net-Appliance-Session-2.111080/
#
# => GOOD 
#

use Try::Tiny;
use Net::Appliance::Session;

my $host    = $ENV{'host'};
my $port    = 22;
my $user    = $ENV{'user'};
my $pass    = $ENV{'pass'};
my $cmd     = $ENV{'cmd'};
my $timeout = 5 * 1000;

my $s = Net::Appliance::Session->new({
    personality => 'ios',
    transport   => 'SSH',
    host        => $ENV{'host'},
    connect_options => { opts => [ '-q', '-o KexAlgorithms=diffie-hellman-group1-sha1'], },
});
$s->set_global_log_at('debug');
try {
    $s->connect(
        username => $ENV{'user'},
        password => $ENV{'pass'}, 
        SHKC => 0,    # Strict Host Key Checking
    );
    # $s->begin_privileged( { password => $ENV{'privilegedpass'} } );
    $output = $s->cmd('ping -c 3 8.8.8.8');
    print("# Output:\n---------\n$output\n----------\n");
    # $s->end_privileged;
} catch {
    warn "failed to execute command: $_";
} finally {
    $s->close();
};
