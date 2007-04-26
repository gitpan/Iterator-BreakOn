use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Iterator::BreakOn',
    license             => 'lgpl',
    dist_author         => '"Víctor Moral" <victor@taquiones.net>',
    dist_version        => '0.3',
    requires => {
        'Test::More'            =>  0,
        'Exception::Class'      =>  0,
        'List::MoreUtils'       =>  0,
        'Class::Accessor'       =>  0,
        'Text::CSV'             =>  0,
    },
    add_to_cleanup      => [ 'Iterator-BreakOn-*' ],
);

$builder->create_build_script();
