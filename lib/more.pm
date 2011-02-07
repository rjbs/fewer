use 5.010;
use strict;
package more;
use less 0.03 ();
use base 'less';
# ABSTRACT: use more of a resource
1;

__END__

=head1 SYNOPSIS

  use more 'variables';

=head1 DESCRIPTION

As of perl5 version 10, the long-useless pragma L<less> became a usable tool
for indicating that less I<something> could be used.  For example, the user
could specify that less memory should be used, and other libraries could then
choose between multiple algorithms based on that choice.

In the user's program:

  use less 'memory';

  my $result = Analyzer->analyze( $large_data_set );

In the library:

  sub analyze {
    my ($self, $data) = @_;

    my $cache  = less->of('memory') ? 'disk' : 'ram';
    my $method = "analyze_with_${cache}_cache";

    return $self->$method($data);
  }

This allowed for an explosion of highly adaptive implementions, accounting for
a complex matrix of "less" interactions.  Unfortunately, there is no mechanism
for requesting that I<more> of something be used, to help do our part as good
consumers.  The often-heard advice to simply write C<< no less 'spending' >> is
insufficient.  That only means we should maintain our current levels.  We want
to request an increase.

This library corrects this deficiency by allowing the user to write:

  use more 'spending';

