#!/usr/bin/env perl

use strict;
use warnings;

use LWP::Simple;
use Archive::Tar::Wrapper;
use File::Copy::Recursive qw(dircopy);

my $ver = $ARGV[0];
if (!defined $ver || $ver !~ /^[0-9]{1,3}\.[0-9]{1,2}(b[0-9]{1,2})?$/) {
    die "Invalid version string\n";
}

my $filename = "firefox-$ver.source.tar.xz";
my $url = "http://archive.mozilla.org/pub/firefox/releases/$ver/source/$filename";
if (! -e $filename) {
    print "Downloading source tarball for Firefox $ver...\n";
    my $e = getstore($url, "./$filename");
    if (is_error($e)) {
        die "Failed to download Firefox $ver, got response $e from server\n";
    }
    print "Done!\n";
}
print "Extracting $filename...\n";
my $tar = Archive::Tar::Wrapper->new();
$tar->read($filename) or die "Failed to extract $filename\n";
my $tardir = $tar->tardir();
dircopy($tardir, './');
print "Done!\nCleaning downloaded files...\n";
unlink $filename or warn "Failed to clean files\n";

