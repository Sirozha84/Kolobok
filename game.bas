'Данные двери
dim dx as ubyte
dim dy as ubyte

sub Game(m() as byte)
	
	'Данные персонажа
	dim px as ubyte
	dim py as ubyte
	dim pn as ubyte		'Направление
	dim pa as ubyte		'Анимация

	'Данные монеток
	dim ct as ubyte		'Монеток собрано
	dim cc as ubyte		'Монеток осталось
	dim ce(5) as ubyte
	dim cx(5) as ubyte
	dim cy(5) as ubyte
	dim ca as ubyte		'Анимация
	
	'Данные ключа
	dim ke as ubyte
	dim kx as ubyte
	dim ky as ubyte
	dim ka as ubyte		'Анимация
	
	'Парсинг карты
	for i = 0 to 15: for j = 0 to 10
		if m(i, j) = 1 then px = i: py = j: pn = 1
		if m(i, j) = 10 then cc = cc + 1: ce(cc) = 1: cx(cc) = i: cy(cc) = j
		if m(i, j) = 11 then kx = i: ky = j
		if m(i, j) = 50 then dx = i: dy = j
	next: next
	
	'Игра
	do
		'Рисуем монетки
		for i = 1 to 5
			if ce(i) then DrawCoin(cx(i), cy(i), ca)
		next
		ca = ca + 1: if ca > 3 then ca = 0
		
		'Рисуем ключ
		if ke = 1 then
			DrawKey(kx, ky, ka)
			ka = ka + 1: if ka > 3 then ka = 0
		end if
		
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
		
		'Проверяем не взяли ли мы монетку
		for i = 1 to 5
			if ce(i) and cx(i) = px and cy(i) = py and pa = 0 then
				'Взяли монетку
				ce(i) = 0
				cc = cc - 1
				ct = ct + 1
				TakeCoin(ct)
				if cc = 0 then
					'Взяли все монетки, активируем ключ
					ke = 1
				end if
			end if
		next
		
		'Проверяем не взяли ли мы ключ
		if ke = 1 and kx = px and ky = py and pa = 0 then
			ke = 0
			OpenDoor(ct)
			m(dx, dy) = 0
		end if
		
		'Проверяем не зашли ли мы в дверь
		if dx = px and dy = py and pa = 0 then
			'Выход из уровня
			CloseDoor()
			return
		end if

		
		Wait(500)
		
	loop
	pause 0
end sub

sub TakeCoin(n as ubyte)
	DrawCoin(n - 1, 11, 0)
	beep 0.05, 0
	beep 0.05, 4
	beep 0.05, 7
	beep 0.05, 12
	end sub

sub OpenDoor(n as ubyte)
	DrawKey(n, 11, 0)
	beep 0.2, 0
	print ink 4; at dy * 2, dx * 2; "U"; at dy * 2 + 1, dx * 2; "u"
	beep 0.2, 4
	print ink 4; at dy * 2, dx * 2; "V"; at dy * 2 + 1, dx * 2; "v"
	beep 0.2, 7
	print ink 4; at dy * 2, dx * 2 + 1; "W"; at dy * 2 + 1, dx * 2 + 1; "w"
	beep 0.2, 12
end sub

sub CloseDoor()
	print ink 4; at dy * 2, dx * 2; "VW"; at dy * 2 + 1, dx * 2; "vw"
	beep 0.2, 12
	print ink 4; at dy * 2, dx * 2; "VT"; at dy * 2 + 1, dx * 2; "vt"
	beep 0.2, 7
	print ink 4; at dy * 2, dx * 2; "U"; at dy * 2 + 1, dx * 2; "u"
	beep 0.2, 4
	print ink 4; at dy * 2, dx * 2; "S"; at dy * 2 + 1, dx * 2; "s"
	beep 0.2, 0
end sub

'Пауза
sub Wait(n as long)
	for i = 1 to n: next
end sub