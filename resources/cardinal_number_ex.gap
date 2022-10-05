## Read("~/Desktop/mygaplearning/cardinal_number_ex.gap");


#nLHnumber(ccs_G[1],ccs_G[2]);
#OrderOfWeylGroup;


#
# This Program is for:
# Calculating the cardinal number table of a given group G
# 
#
# Originally by Wieslaw Krawcewicz, Zhichao Li
# Edited by Ziad Ghanem


# Define Group G
#G:=DirectProduct(SymmetricGroup(2),SymmetricGroup(5),SymmetricGroup(4));


########## Declare Global Variables ##########
nLH_Table_G := [];

#ccs_G:=ConjugacyClassesSubgroups(G);




########## Calculate the cardinal number: n(L,H) #############
#                                                            #
# L, H are conjugacy classes (L) and (H)					 #
#                                                            #
# n(L,H) = |{H' in (H): L < H'}|                             #
#                                                            #
##############################################################

calculate_nLH_number := function(G)
	local	counter,
		i,j,k;
	

	Print("\n", "Calculating n(L,H) numbers ", "......", "\n");

	
	for i in [1..Size(ccs_G)] do 
		Add(nLH_Table_G, []);
		
		for j in [1..Size(ccs_G)] do 
			Add(nLH_Table_G[i], []);
		od;
		
	od;
	
	for i in [1..Size(ccs_G)] do # i is L here

		for j in [1..Size(ccs_G)] do # j is H here		
			counter := 0;
			
			for k in RightTransversal(G, Normalizer( G, Representative(ccs_G[j]) ) ) do
				if IsSubgroup( ConjugateGroup(Representative(ccs_G[ j]), k ) , Representative(ccs_G[i])) then
					counter := counter + 1;
				fi;			
			od;
			
			nLH_Table_G[i][j] := counter;
			
		od;

	od;
#	
#	for i in [1..Length(ccs_G)] do
#		for j in [1..Length(ccs_G)] do
#		
#			Print(nLH_Table_G[[i][j], " ");
#		od;
#		Print("\n");
#	od;
#

	Print("\n", "Done ......", "\n");

	return;
end; # calculate_nLH_number := function()