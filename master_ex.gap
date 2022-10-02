## Read("master_ex.gap");

LoadPackage("EquiDeg");
G:=DirectProduct(SymmetricGroup(2),SymmetricGroup(4));


master := function(G)
	
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

	Print("\n", "Writing to file ......", "\n");
	Read("resources/write_file_ex.gap");
	create_file(G_Multiplication_Table, "s2_s4");

	Print("\n", "Done ......", "\n");
	
	return;



end; # master := function()

