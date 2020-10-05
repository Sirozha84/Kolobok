dim nap as ubyte
dim a as ubyte
sub Game(m() as byte, x as byte, y as byte)
	nap = 1
	a = 0
	do
		'Персонаж
		if a = 0 then
			if (inkey = "q" or inkey = chr(11)) and m(x, y - 1) < 50 then y = y - 1: nap = 0: a = 1
			if (inkey = "a" or inkey = chr(10)) and m(x, y + 1) < 50 then y = y + 1: nap = 2: a = 1
			if (inkey = "o" or inkey = chr(8)) and m(x - 1, y) < 50 then x = x - 1: nap = 3: a = 1
			if (inkey = "p" or inkey = chr(9)) and m(x + 1, y) < 50then x = x + 1: nap = 1: a = 1
		end if
		DrawKolobok(x, y, nap, a)
		if a = 2 then beep 0.01, 0: a = 0
		if a = 1 then beep 0.01, 24: a = 2
		
		'Пауза
		for i = 1 to 2000: next
		
	loop
	pause 0
end sub