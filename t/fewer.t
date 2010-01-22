use strict;
use warnings;

use less  'explanation';
use fewer 'excuses';

use Test::More 'no_plan';

ok(less->of('explanation'));
ok(fewer->of('explanation'));

ok(less->of('excuses'));
ok(fewer->of('excuses'));
