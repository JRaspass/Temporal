use v5.38;
use Object::Pad;

class Temporal::Instant 0.001;

use overload '""' => sub ($self, $, $) { $self->toString };

field $epochNanoseconds :param;

sub BUILDARGS ($, $epochNanoseconds) { epochNanoseconds => $epochNanoseconds }

sub fromEpochNanoseconds  ($class, $epochNanoseconds ) { $class->new($epochNanoseconds  * 1e0) }
sub fromEpochMicroseconds ($class, $epochMicroseconds) { $class->new($epochMicroseconds * 1e3) }
sub fromEpochMilliseconds ($class, $epochMilliseconds) { $class->new($epochMilliseconds * 1e6) }
sub fromEpochSeconds      ($class, $epochSeconds     ) { $class->new($epochSeconds      * 1e9) }

method epochNanoseconds  () { int $epochNanoseconds / 1e0 }
method epochMicroseconds () { int $epochNanoseconds / 1e3 }
method epochMilliseconds () { int $epochNanoseconds / 1e6 }
method epochSeconds      () { int $epochNanoseconds / 1e9 }

method add { ... }

method compare { ... }

method equals { ... }

method round { ... }

method since { ... }

method subtract { ... }

method toJSON () { ... }

method toLocaleString { ... }

method toString { ... }

method toZonedDateTime { ... }

method toZonedDateTimeISO { ... }

method until { ... }

__END__

https://tc39.es/proposal-temporal/docs/instant.html
