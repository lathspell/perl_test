#!/usr/bin/perl

use strict;
use warnings;
use REST::Client;
 
$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME} = 0;

my $client = REST::Client->new({
    'host' => 'https://numberman-devel.nmc.netcologne.intern/proxy/numberman/devel/numberman/backend.php/zebra'
});
$client->GET('/areacodes/');
printf("HTTP Status: %s\nBODY:\n%s\n", $client->responseCode(), $client->responseContent());

