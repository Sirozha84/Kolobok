'Рисование уровня
sub DrawLevel(m() as byte)
	SetFont(1)
	for i = 0 to 15: for j = 0 to 10
		if m(i,j)=0 then print at j * 2, i * 2; "  "; at j * 2 + 1, i * 2; "  "
		if m(i,j)=50 then print ink 4; at j * 2, i * 2; "ST"; at j * 2 + 1, i * 2; "st"
		if m(i,j)=100 then print at j * 2, i * 2; ink 6; paper 2; "!"""; at j * 2 + 1, i * 2; """!"
	next: next
end sub

'Рисование колобка, n - направление 0 - вверх, 1 - вправо, 2 - вниз, 3 - влево, a - кадр анимации 0-1
sub DrawKolobok(x as byte, y as byte, n as byte, a as byte)
	if n = 0 then
		if a = 0 then print ink 3; bright 1; at y * 2, x * 2; "GH"; at y * 2 + 1, x * 2; "ae"
		if a = 1 then print ink 3; bright 1; at y * 2 + 1, x * 2; "gh"; at y * 2 + 2, x * 2; "ae"; at y * 2 + 3, x * 2; "  "
		if a = 2 then print ink 3; bright 1; at y * 2, x * 2; "GH"; at y * 2 + 1, x * 2; "ae"; at y * 2 + 2, x * 2; "  "
	end if
	if n = 1 then
		if a = 0 then print ink 3; bright 1; at y * 2, x * 2; "AB"; at y * 2 + 1, x * 2; "ab"
		if a = 1 then print ink 3; bright 1; at y * 2, x * 2 - 2; " AC"; at y * 2 + 1, x * 2 - 2; " ac"
		if a = 2 then print ink 3; bright 1; at y * 2, x * 2 - 1; " AB"; at y * 2 + 1, x * 2 - 1; " ab"
	end if
	if n = 2 then
		if a = 0 then print ink 3; bright 1; at y * 2, x * 2; "AE"; at y * 2 + 1, x * 2; "IJ"
		if a = 1 then print ink 3; bright 1; at y * 2 - 2, x * 2; "  "; at y * 2 - 1, x * 2; "AE"; at y * 2, x * 2; "ij"
		if a = 2 then print ink 3; bright 1; at y * 2 - 1, x * 2; "  "; at y * 2, x * 2; "AE"; at y * 2 + 1, x * 2; "IJ"
	end if
	if n = 3 then
		if a = 0 then print ink 3; bright 1; at y * 2, x * 2; "DE"; at y * 2 + 1, x * 2; "de"
		if a = 1 then print ink 3; bright 1; at y * 2, x * 2 + 1; "FE "; at y * 2 + 1, x * 2 + 1; "fe "
		if a = 2 then print ink 3; bright 1; at y * 2, x * 2; "DE "; at y * 2 + 1, x * 2; "de "
	end if
	'SetFont(0):print at 22,0;a
end sub

'Рисование двери
sub DrawDoor(x as byte, y as byte)
	print ink 6; at y * 2, x * 2; "!!"; y * 2 + 1, x * 2; "!!"
end sub