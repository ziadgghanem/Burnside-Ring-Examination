## Read("~/Desktop/mygaplearning/multiplication_table_ex.gap");

#
# This Program is for:
# Calculating Burnside Ring multiplication table of a given group G
# 
#
# Originally by Wieslaw Krawcewicz, Zhichao Li
# Edited by Ziad Ghanem


# Define Group G
#G:=DirectProduct(SymmetricGroup(2),SymmetricGroup(5),SymmetricGroup(4));


########## Declare Global Variables ##########


G_Multiplication_Table := [];




##############################################################
#                                                            #
# calculate multiplication table for Burnside Ring           #
#                                                            #
##############################################################


calculate_multiplication_table := function( G )
	
local	
	counter,
	h,i,j,k,l,m,n;

	Print("\n", "Beep... Boop...", "\n", "Calculating Multiplication Table ", "......", "\n");

	
	for i in [1..Size(ccs_G)] do 
		Add(G_Multiplication_Table, []);
		
		for j in [1..Size(ccs_G)] do 
			Add(G_Multiplication_Table[i], []);

			for k in [1..Size(ccs_G)] do 
				Add(G_Multiplication_Table[i][j], []);
				
				G_Multiplication_Table[i][j][k] := 0;
			od;


		od;
		
	od;
	
	

	j := Size(ccs_G);  # j is H


	while j>= 1 do
		k := Size(ccs_G); # k is K
		while k>= 1 do
			i := Size(ccs_G);  # i is L
			while i>= 1 do
				
				# normalizer of ccs_G[ ] in G

				
				# Weyl's Group of ccs_G[ ] in G is the Quotient Group N(ccs_G[ ])/ccs_G[ ]


				counter :=	nLH_Table_G[i][j] *
						Weyl_G[j] *
						nLH_Table_G[i][k] *
						Weyl_G[k];
						
						
				
				l := Size(ccs_G);  # l is L tilde
				while l> i do
 
					counter := counter - 
							(G_Multiplication_Table[j][k][l] * 
							nLH_Table_G[ i ] [ l ] * 
							Weyl_G[l]);
				
					l := l - 1;
				od;


				counter := QuoInt(counter,Weyl_G[i]);
	
				G_Multiplication_Table[j][k][i] := counter;
				
	
				i := i - 1;
			od;
	
	
			k := k -1 ;
		od;
	
	
		j := j-1;
	od;
		

	return;
end; # calculate_multiplication_table := function()