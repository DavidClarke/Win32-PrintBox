use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Win32::PrintBox',
    license             => 'perl',
    dist_author         => q{DClarke <dclarke@cpan.org>},
    dist_version_from   => 'lib/Win32/PrintBox.pm',
    build_requires => {
        'Test::More' => 0,
        'Test::Differences' => 0,
    },

    configure_requires => {
        'Module::Build'         => '0.4',
    },
    requires => {
        'perl'                  => '5.010',
        'Win32'                 => 0,
        'Win32::Console::ANSI'  => 0,
    },
    add_to_cleanup      => [qw(FHX-* *.zip ) ],
    create_makefile_pl => 'traditional',
);


$builder->create_build_script();
