sub Game(m() as byte, x as byte, y as byte)
	nap = 1
	a = 0
	do
		if a = 0 then
			if (inkey = "q" or inkey = chr(11)) and m(x, y - 1) < 50 then y = y - 1: nap = 0: a = 1
			if (inkey = "a" or inkey = chr(10)) and m(x, y + 1) < 50 then y = y + 1: nap = 2: a = 1
			if (inkey = "o" or inkey = chr(8)) and m(x - 1, y) < 50 then x = x - 1: nap = 3: a = 1
			if (inkey = "p" or inkey = chr(9)) and m(x + 1, y) < 50then x = x + 1: nap = 1: a = 1
		else
			a = a + 1
			if a > 2 then a = 0
		end if
		DrawKolobok(x, y, nap, a)
		if a = 1 then beep 0.1, 12
		if a = 2 then beep 0.1, 24
	loop
	pause 0
end sub