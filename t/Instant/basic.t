use Test2::V0 -target => 'Temporal::Instant';

my $bigIntInstant = Temporal::Instant->new(217175010123456789);
isa_ok($bigIntInstant, 'Temporal::Instant');
is($bigIntInstant->epochSeconds, 217175010, "BigInt epochSeconds");
is($bigIntInstant->epochMilliseconds, 217175010123, "BigInt epochMilliseconds");

my $stringInstant = Temporal::Instant->new("217175010123456789");
isa_ok($stringInstant, 'Temporal::Instant');
is($stringInstant->epochSeconds, 217175010, "String epochSeconds");
is($stringInstant->epochMilliseconds, 217175010123, "String epochMilliseconds");

# TODO
# ok dies { Temporal::Instant->new("abc123") }, "invalid BigInt syntax";

done_testing;

__END__

// Copyright (C) 2021 Igalia, S.L. All rights reserved.
// This code is governed by the BSD license found in the LICENSE file.

/*---
esid: sec-temporal.instant
description: Basic functionality of the Temporal.Instant constructor
features: [Temporal]
---*/

const bigIntInstant = new Temporal.Instant(217175010123456789n);
assert(bigIntInstant instanceof Temporal.Instant, "BigInt instanceof");
assert.sameValue(bigIntInstant.epochSeconds, 217175010, "BigInt epochSeconds");
assert.sameValue(bigIntInstant.epochMilliseconds, 217175010123, "BigInt epochMilliseconds");

const stringInstant = new Temporal.Instant("217175010123456789");
assert(stringInstant instanceof Temporal.Instant, "String instanceof");
assert.sameValue(stringInstant.epochSeconds, 217175010, "String epochSeconds");
assert.sameValue(stringInstant.epochMilliseconds, 217175010123, "String epochMilliseconds");

assert.throws(SyntaxError, () => new Temporal.Instant("abc123"), "invalid BigInt syntax");
