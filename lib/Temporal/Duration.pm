use v5.38;
use Object::Pad;

class Temporal::Duration 0.001;

use builtin 'false';
no warnings 'experimental';

field $years        :param :reader //= 0;
field $months       :param :reader //= 0;
field $weeks        :param :reader //= 0;
field $days         :param :reader //= 0;
field $hours        :param :reader //= 0;
field $minutes      :param :reader //= 0;
field $seconds      :param :reader //= 0;
field $milliseconds :param :reader //= 0;
field $microseconds :param :reader //= 0;
field $nanoseconds  :param :reader //= 0;

sub BUILDARGS ($, @args) {
    my %args;
    @args{qw{
        years months weeks days hours minutes
        seconds milliseconds microseconds nanoseconds
    }} = @args;
    return %args;
}

sub from { undef }

# https://tc39.es/proposal-temporal/#sec-temporal-temporaldurationtostring
method toString {
    my $datePart = '';
    $datePart .= abs($years)  . 'Y' if $years  != 0;
    $datePart .= abs($months) . 'M' if $months != 0;
    $datePart .= abs($weeks)  . 'W' if $weeks  != 0;
    $datePart .= abs($days)   . 'D' if $days   != 0;

    my $timePart = '';
    $timePart .= abs($hours)   . 'H' if $hours   != 0;
    $timePart .= abs($minutes) . 'M' if $minutes != 0;

    my $zeroMinutesAndHigher = false;

    my $result = 'P' . $datePart;
    $result .= 'T' . $timePart if $timePart ne '';
    return $result;
}
