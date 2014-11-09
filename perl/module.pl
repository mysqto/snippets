#!/usr/bin/env perl
use warnings;
use strict;

# find stock perl modules path, got by google, original post addr:
# http://www.symkat.com/find-a-perl-modules-path
for my $module ( @ARGV ) {
        my $package = $module;

        s/::/\//g, s/$/.pm/ for $module;

        if ( require $module ) {
                print $package . " ==> " . $INC{$module} . "\n";
        }
}
