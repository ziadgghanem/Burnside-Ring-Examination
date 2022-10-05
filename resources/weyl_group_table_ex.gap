## Read("~/Desktop/mygaplearning/weyl_group_table_ex.gap");

#
# This Program is for:
# Calculating the Weyl Groups of our conjugacy classes given a group G
# 
#
# Originally by Wieslaw Krawcewicz, Zhichao Li
# Edited by Ziad Ghanem



########## Declare Global Variables ##########


Weyl_G := [];



##############################################################
#                                                            #
# calculate Weyl Group for Conjugacy Classes of G            #
#                                                            #
##############################################################


calculate_weyl_groups := function( G )
	
local	
	counter,
	i;

	Print("\n", "Beep... Boop...", "\n", "Calculating Weyl Groups ", "......", "\n");

	
	for i in [1..Size(ccs_G)] do 
		Add(Weyl_G, []);
		Norm_ccs:= Normalizer(G,Representative(ccs_G[i]));
		Weyl_ccs:= FactorGroup(Norm_ccs, Representative(ccs_G[i])); 
		Weyl_G[i]:= Order(Weyl_ccs);
		
	od;
	
	Print("\n", "Done ......", "\n");

	return;
end; # calculate_weyl_groups := function()
	
