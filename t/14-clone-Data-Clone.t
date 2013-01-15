use 5.12.0;
use warnings FATAL => 'all';

use FindBin;
use File::Spec;

use Test::More;
use Test::Exception;

use lib $FindBin::Bin;
use CloneTest;

BEGIN {
	eval 'use Data::Clone';
	if( $@ ) {
		plan skip_all => 'Data::Clone required for testing' 
	}
}

use Config::Source clone => \&Data::Clone::clone;

my $config = Config::Source->new;

CloneTest->test( $config );

done_testing();


1;
