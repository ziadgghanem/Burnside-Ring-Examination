## Read("~/Desktop/mygaplearning/calculate_irreducible_orbit_types_ex.gap");

#
# This Program is for:
# returning a list of Brng elements
# associated with the irreducible orbit types in G
# These are the involutary elements in the Brng
#
# Originally by Wieslaw Krawcewicz, Zhichao Li
# Edited by Ziad Ghanem


calculate_irr_orbtyps := function(irr)

	irr_orbtyps := [];

	# ToDenseList returns list of coefficients of element in brng
	for i in [2 .. Size(irr)] do
		Add(irr_orbtyps, []);
		irr_orbtyps[i-1]:= ToDenseList(BasicDegree(irr[i]));;
	od;

	Print("\n", "Done ......", "\n");
	
	return;
end; # calculate_irr_orbtyps := function()
	