sub Game(m() as byte)
	
	'Данные персонажа
	dim px as ubyte
	dim py as ubyte
	dim pn as ubyte
	dim pa as ubyte

	'Данные монеток
	dim cc as ubyte
	dim ce(5) as ubyte
	dim cx(5) as ubyte
	dim cy(5) as ubyte
	dim ca as ubyte
	
	'Парсинг карты
	for i = 0 to 15: for j = 0 to 10
		if m(i, j) = 1 then px = i: py = j: pn = 1
		if m(i, j) = 10 then
			cc = cc + 1
			ce(cc) = 1
			cx(cc) = i
			cy(cc) = j
		end if
	next: next
	
	'Игра
	do
		'Монетки
		for i = 1 to 5
			if ce(i) then
				DrawCoin(cx(i), cy(i), ca)
				if (cx(i) = px and cy(i) = py) then
					ce(i) = 0
					cc = cc - 1
					'Взяли монетку
					
					
					if cc = 0 then
						'Собрали все мониетки
						
					end if
				end if
			end if
			'print at i,0; ce(i)
		next
		ca = ca + 1
		if ca > 3 then ca = 0
	
		'Персонаж
		if pa = 0 then
			if (inkey = "q" or inkey = chr(11)) and m(px, py - 1) < 50 then py = py - 1: pn = 0: pa = 1
			if (inkey = "a" or inkey = chr(10)) and m(px, py + 1) < 50 then py = py + 1: pn = 2: pa = 1
			if (inkey = "o" or inkey = chr(8)) and m(px - 1, py) < 50 then px = px - 1: pn = 3: pa = 1
			if (inkey = "p" or inkey = chr(9)) and m(px + 1, py) < 50then px = px + 1: pn = 1: pa = 1
		end if
		DrawKolobok(px, py, pn, pa)
		if pa = 2 then beep 0.01, 0: pa = 0
		if pa = 1 then beep 0.01, 24: pa = 2
		
		Wait(500)
		
	loop
	pause 0
end sub

'Пауза
sub Wait(n as long)
	for i = 1 to n: next
end sub