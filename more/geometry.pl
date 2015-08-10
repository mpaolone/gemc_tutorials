#!/usr/bin/perl -w

# loading GEMC geometry routines
use strict;
use lib ("$ENV{GEMC}/io");
use utils;
use geometry;

# Define the Help Message
sub help()
{
	print "\n Usage: \n";
	print "   geometry.pl <configuration filename>\n";
 	print "   Will create a paddle using the variation specified in the configuration file\n";
	exit;
}

# Make sure the argument list is correct
# If not pring the help
if( scalar @ARGV != 1)
{
	help();
	exit;
}

# Loading configuration file (first argument)
our %configuration = load_configuration($ARGV[0]);

sub build_target
{
	my %detector = init_det();
	$detector{"name"}        = "target";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Example of target";
	$detector{"pos"}         = "0*cm 0*cm 0*cm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "880000";
	$detector{"type"}        = "Tube";
	$detector{"dimensions"}  = "0*cm 2*cm 2*mm 0*deg 360*deg";
	$detector{"material"}    = "G4_C";
#	$detector{"material"}    = "G4_lH2";
	$detector{"visible"}     = 1;
	$detector{"style"}       = 1;
	print_det(\%configuration, \%detector);
}


#sub build_simple_paddle
#{
#	my %detector = init_det();
#	$detector{"name"}        = "paddle_1";
#	$detector{"mother"}      = "root";
#	$detector{"description"} = "Example of paddle";
#	$detector{"pos"}         = "0*cm 0*cm 30*cm";
#	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
#	$detector{"color"}       = "339999";
#	$detector{"type"}        = "Box";
#	$detector{"dimensions"}  = "2*cm 2*cm 8*cm";
#	$detector{"material"}    = "G4_GLASS_LEAD";
#	$detector{"visible"}     = 1;
#	$detector{"style"}       = 1;
#	print_det(\%configuration, \%detector);
#}

sub build_simple_paddle
{
	my %detector = init_det();
	$detector{"name"}        = "ring_det";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Example of ring";
	$detector{"pos"}         = "0*cm 0*cm 0*cm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "00FF17";
	$detector{"type"}        = "Sphere";
	$detector{"dimensions"}  = "30*cm 30.1*cm 0*deg 360.0*deg 12.5*deg 5.0*deg";
	$detector{"material"}    = "Vacuum";
	$detector{"visible"}     = 1;
	$detector{"style"}       = 1;
#	$detector{"sensitivity"} = "FLUX";
	$detector{"sensitivity"} = "flux";
	$detector{"hit_type"}    = "flux";
#	$detector{"identifiers"} = "id manual 1";
	print_det(\%configuration, \%detector);
}



build_simple_paddle();
build_target();
