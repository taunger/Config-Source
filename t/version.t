use strict;
use warnings FATAL => 'all';

use Test::More;
use Test::Exception;
use Config::Source;

# check if POD version equals $VERSION
lives_ok {
	my $path = $INC{'Config/Source.pm'};
	
	open my $fh, '<', $path or die $!;
	my $source = do { local $/; <$fh> };
	close $fh;
	
	$source =~ /Version\s+(\d+\.\d+)/s
		or die 'Parse error';
	
	my $ver = $1;
	
	is( $ver, $Config::Source::VERSION, "Version strings are same" );
	
} 'Testing ok';

done_testing();

1;