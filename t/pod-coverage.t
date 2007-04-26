#!perl -T

use Test::More qw(no_plan);

eval "use Test::Pod::Coverage 1.04";

plan skip_all => "Test::Pod::Coverage 1.04 required for testing POD coverage" if $@;

my @modules = grep { $_ !~ m{(X|BreakOn)\z}xms } all_modules();

foreach my $module (@modules) {
    pod_coverage_ok( $module );
}

