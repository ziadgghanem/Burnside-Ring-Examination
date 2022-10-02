## Read("~/Desktop/mygaplearning/write_file_ex.gap");

	
	
	
create_file := function(T, name)
	local	gsys; 	
	
	gsys := Concatenation( name, ".json" );

	gsys := OutputTextFile( gsys, false );
	SetPrintFormattingStatus( gsys, false );
	
	Print("\n", "Creating File ......", "\n");

	PrintTo(gsys, T);
	
	CloseStream( gsys ); # this command will close gsys file
	Print("\n", "Closing File ......", "\n");
	
	return;



end; # create_file := function()
