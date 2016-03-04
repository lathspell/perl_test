#!/usr/bin/perl
#
# http://cpansearch.perl.org/src/IVAN/Net-SSH-0.09/README
#
# Quote from README:
#   "Assitance wanted - this module could really use a maintainer with enough time
#   to at least review and apply more patches.  Or the module should just be
#   deprecated in favor of Net::SSH::Expect or made into an ::Any style
#   compatibility wrapper that uses whatver implementation is avaialble
#   (Net::SSH2, Net::SSH::Perl or shelling out like the modules does now)."
#
# Quoting from FAQ:
#   Q: How do you supply a password to connect with ssh within a perl script
#      using the Net::SSH module?
#   A: You don't (at least not with this module).  Use RSA or DSA keys.  See the
#      quick help in the next section and the ssh-keygen(1) manpage.
# 
# =>    DO NOT USE
#

use strict;

use Net::SSH qw(ssh issh sshopen2 sshopen3);

ssh_cmd( {
    user => $ENV{'user'},
    host => $ENV{'host'},
    command => $ENV{'cmd'},
    args => [ '', '' ],
    stdin_string => "",
  } );

# UNFINISHED