## Read("master_ex.gap");

LoadPackage("EquiDeg");
G:=DirectProduct(SymmetricGroup(2),SymmetricGroup(4));


master := function(G, name)
	
	Print("\n", "Building Burnside Ring ......", "\n");
	# ConjugacyClassesSubgroups: lists all conjugacy classes of subgroups of G
	ccs_G:=ConjugacyClassesSubgroups(G);
	# Irr: Lists irreducible Representations of G
	irr:=Irr(G);
	AG:=BurnsideRing(G);
	H:=Basis(AG);

	Print("\n", "Calculating cardinal numbers ......", "\n");
	Read("resources/cardinal_number_ex.gap");
	calculate_nLH_number(G);
	
	Print("\n", "Calculating size of weyl groups ......", "\n");
	Read("resources/weyl_group_table_ex.gap");
	calculate_weyl_groups(G);
	
	Print("\n", "Building Burnside Multiplication Table ......", "\n");
	Read("resources/multiplication_table_ex.gap");
	calculate_multiplication_table(G);

	Print("\n", "Calculating Irreducible Orbit Types ......", "\n");
	Read("resources/calculate_irreducible_orbit_types_ex.gap");
	calculate_irr_orbtyps(irr);

	Print("\n", "Calculating Maximal Orbit Types ......", "\n");
	Read("resources/calculate_max_orbit_types_ex.gap");
	calculate_max_orbtyps(irr);

	Print("\n", "Writing to file ......", "\n");
	Read("resources/write_file_ex.gap");
	create_file([G_Multiplication_Table, irr_orbtyps, max_orbtyps], name);

	Print("\n", "Done ......", "\n");
	
	return;



end; # master := function()

