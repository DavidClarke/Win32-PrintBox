#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Win32::PrintBox' ) || print "Bail out!
";
}

diag( "Testing Win32::PrintBox $Win32::PrintBox::VERSION, Perl $], $^X" );
