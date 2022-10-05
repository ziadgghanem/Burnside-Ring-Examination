## Read("~/Desktop/mygaplearning/write_file_ex.gap");


#
# This Program is for
# printing to data to a .json
# X can be a list of objects
# name should inform the group

	
create_file := function(X, name)
	local	gsys; 	
	
	gsys := Concatenation( name, ".json" );

	gsys := OutputTextFile( gsys, false );
	SetPrintFormattingStatus( gsys, false );
	
	Print("\n", "Creating File ......", "\n");

	for i in [1..Size(X)] do
		PrintTo(gsys, X[i]);
	od;

	CloseStream( gsys ); # this command will close gsys file
	Print("\n", "Closing File ......", "\n");
	
	return;



end; # create_file := function()
