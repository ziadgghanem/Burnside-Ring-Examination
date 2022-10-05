## Read("~/Desktop/mygaplearning/calculate_max_orbit_types_ex.gap");

#
# This Program is for:
# returning a list of indices of basis elements in Brng 
# associated with the maximal orbit types in G
# 
#
# Originally by Wieslaw Krawcewicz, Zhichao Li
# Edited by Ziad Ghanem


calculate_max_orbtyps := function(irr)
    # isotypic decomposition of irreducible orbtyps
    # skip irr[1] initialize with irr[2]
    chi:=irr[2];

    for i in [ 3 .. Size(irr) ] do
        chi := chi + irr[i];
    od;

    orbtyps := ShallowCopy( OrbitTypes( chi ) ); 

    # Removes G from orbtyps
    Remove( orbtyps );
    orbtyps := MaximalElements( orbtyps );

    max_orbtyps := List( orbtyps , IdCCS );
    max_orbtyps := [max_orbtyps];

    Print("\n", "Done ......", "\n");
    
	return;
end; # calculate_max_orbtyps := function()