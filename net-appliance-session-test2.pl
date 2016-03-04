#!/usr/bin/perl
#
# http://search.cpan.org/~oliver/Net-Appliance-Session-4.131260/lib/Net/Appliance/Session.pm
#
# Cookbook:
#   http://search.cpan.org/~oliver/Net-Appliance-Session-2.111080/
#
# => GOOD
#

use common::sense;
use Try::Tiny;
use Net::Appliance::Session;

# Make sure to have >= 4.1
print("Net::Appliance::Session::VERSION: " . ($Net::Appliance::Session::VERSION) . "\n");

my $host    = $ENV{'host'};
my $port    = 22;
my $user    = $ENV{'user'};
my $pass    = $ENV{'pass'};
my $cmd     = $ENV{'cmd'};

my $s = Net::Appliance::Session->new({
    personality => 'ios',      # <- file .../cisco/ios/pb
    transport   => 'SSH',
    host        => $ENV{'host'},
    connect_options => { opts => [ '-q', ], },
});
try {
    $s->set_global_log_at('warning');
    $s->connect(
        username => $ENV{'user'},
        password => $ENV{'pass'},
    );
    my $output = $s->cmd('ping 8.8.8.8');
    print("# Output:\n---------\n$output\n----------\n");
} catch {
    warn "failed to execute command: $_";
} finally {
    $s->close();
};
