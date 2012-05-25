#!perl -T

use strict;
use warnings;
use Test::More tests => 2;
use Win32::PrintBox;

############# Windows warn
my $file = "_zz-03.tmp";

# Override Win32::MsgBox with a sub to creat a temp file with the message contents
my $sub = <<"";
sub Win32::MsgBox {
    my \$msg = shift; 
    open (OUT, \'>\', \'$file\');
    print OUT \$msg;
    close OUT;
}

$sub =~ s/\n//g;
`wperl -MWin32::PrintBox -e "eval q/$sub/;  warn qq(WARN); " `;
my $w = get($file);
# use pattern match instead of eq, since warn appends the line number
ok($w =~ m/WARN/, "Windows warn:$w");
unlink $file;

############# Windows print
`wperl -MWin32::PrintBox -e "eval q/$sub/;  print qq(PRINT); " `;
my $p = get($file);
ok($p =~ m/PRINT/, "Windows print:$p");
unlink $file;

sub get {
    my $f = shift;
    open IN, $f;
    my $c = <IN>;
    close IN;
    return $c;
}
    