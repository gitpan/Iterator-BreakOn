package Iterator::BreakOn::Base::Event;
use base qw(Class::Accessor);
use strict;
use warnings;
use Carp;

#
#   I'm using This pseudo class the limitations of Class::Accessor for
#   overriding autogenerated accessors
#   

our $VERSION = '0.1';

Iterator::BreakOn::Base::Event->mk_accessors( qw( name field value ) );

package Iterator::BreakOn::Event;
use base qw(Iterator::BreakOn::Base::Event);
use strict;
use warnings;
use Carp;

use Iterator::BreakOn::X;

our $VERSION = '0.1';

sub name {
    my  $self   =   shift;
    my  $value  =   shift;

    if (defined($value)) {
        if ($value =~ m{on_first|on_last|on_every|
                        before_(\w+)|after_(\w+)}xms) {
            return $self->SUPER::name( $value );
        }
        else {
            Iterator::BreakOn::X->invalid_event->throw( name => $value );
        }
    }
        
    return $self->SUPER::name();
}

1;
__END__
=pod

=head1 NAME

Iterator::BreakOn::Event - Build and destroy events

=head1 VERSION

This documentation refers to Iterator::BreakOn::Event version 0.1

=head1 SYNOPSIS

    use Iterator::BreakOn::Event;

    my $event = Iterator::BreakOn::Event->new( { 
                    name    => 'before_location',
                    field   =>  'location',
                    value   =>  'AVILA',
                    });

    if ($event->name() eq 'AVILA') {
        # do something ...

    }

=head1 DESCRIPTION

This module build and destroy event objects for the Iterator::BreakOn package.

=head1 SUBROUTINES/METHODS

=head2 new( )

Create and initialize a new Iterator::BreakOn::Event object. Return a
reference to the new object or undef in case of fail.

=head2 name( )

Accessor/mutator for the event name. This parameter only can be 'on_first',
'on_last', 'on_every', 'before_*', or 'after_*'; other values raise an
exception.

=head2 field( )

Accessor/mutator for the field attribute of the object.

=head2 value( )

Accessor/mutator for the value attribute of the object.

=head1 DIAGNOSTICS

=over

=item invalid event name 

=back

=head1 DEPENDENCIES

=over

=item Class::Accessor

=back

=head1 BUGS AND LIMITATIONS

There are no known bugs in this module.
Please report problems to the author.
Patches are welcome.

=head1 AUTHOR

Víctor Moral <victor@taquiones.net>

=head1 LICENSE AND COPYRIGHT

