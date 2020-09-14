sub DrawKolobok(x as ubyte, y as ubyte, n as ubyte, a as ubyte)
	if n = 0 then
		if a = 0 then print at y, x; ink 3; bright 1; "GH"; at y+1,x; "ae";
		if a = 1 then print at y, x; ink 3; bright 1; "gh"; at y+1,x; "ae";
	end if
	if n = 1 then
		if a = 0 then print at y, x; ink 3; bright 1; "AB"; at y+1,x; "ab";
		if a = 1 then print at y, x; ink 3; bright 1; "AC"; at y+1,x; "ac";
	end if
	if n = 2 then
		if a = 0 then print at y, x; ink 3; bright 1; "AE"; at y+1,x; "IJ";
		if a = 1 then print at y, x; ink 3; bright 1; "AE"; at y+1,x; "ij";
	end if
	if n = 3 then
		if a = 0 then print at y, x; ink 3; bright 1; "DE"; at y+1,x; "de";
		if a = 1 then print at y, x; ink 3; bright 1; "FE"; at y+1,x; "fe";
	end if
end sub