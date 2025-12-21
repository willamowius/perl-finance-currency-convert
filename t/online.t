#!/usr/bin/perl
use strict;
use warnings;
use Test::More qw( no_plan );
use Test::NoWarnings;
use Test::RequiresInternet;
BEGIN { use_ok('Finance::Currency::Convert') };

use Finance::Currency::Convert;

my $converter = new Finance::Currency::Convert;

eval "use Finance::Quote";
if ($@) {
	$converter->updateRates("AUD", "USD");
	my $amount17 = $converter->convertFromEUR(1, "USD");
	ok($amount17 > 0.5, 'sanity check on USD rate');
	ok($amount17 < 2, 'sanity check on USD rate');
	my $amount18 = $converter->convertToEUR(1, "AUD");
	ok($amount18 > 0.1, 'sanity check on AUD rate');
	ok($amount18 < 1, 'sanity check on AUD rate');
}

