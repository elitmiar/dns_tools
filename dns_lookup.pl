use strict;
use warnings FATAL => 'all';

use Net::DNS;

my $domain = "my-domain-to-lookup.com";
# Here we create a new resolver object
my $res = Net::DNS::Resolver->new;
# Perform the search query
my $query = $res->search($domain);

if ($query) {
    foreach my $rr ($query->answer) {
        # Need to print the A record IP address
        next unless $rr->type eq "A";
        print "${domain}'s address is: ", $rr->address, "\n";
    }
} else {
    # Printing to Standard error
    warn "Query lookup has failed: ", $res->errorstring, "\n";
}
