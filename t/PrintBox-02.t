#!perl -T

use strict;
use warnings;
use Test::More tests => 1;
use Win32::PrintBox;

############# New Shell , check for 'Press any key to continue'
# Since start is used to make a new console window, can not use results of back ticks to test for output
my $file = "_zz-02.tmp";
`start perl -MWin32::PrintBox -e "eval qq(sub Win32::PrintBox::pause_in {mkdir qq[$file];} ); "`;
ok(-d $file, "Prompt displayed");
rmdir $file;
