#include <c:\Projects\Kolobok\fonts.bas>
#include <c:\Projects\Kolobok\game.bas>
#include <c:\Projects\Kolobok\graphics.bas>

ScreenClear()

SetFont(1)
print ink 3; bright 1; at 9, 15; "AB"; at 10, 15; "ab"
SetFont(0)
print at 12,12;"kolobok!"
print at 14,8;"igra dlq arseniq,"; at 15,6; "sdelannaq ego papoj"
print at 17,5; flash 1;"na~alo - l`baq klawi{a"
print at 23,5; "wersiq 0.1 (09.10.2020)"

do
	for c = 7 to 0 step -1:border c: next
loop until inkey <> ""

do
	'Стены
	dim m(16,10) as byte
	for i = 0 to 15: for j = 0 to 10: m(i,j) = 0:next:next
	for i = 0 to 15: m(i,0)=100: m(i,10)=100: next
	for i = 0 to 10: m(0,i)=100: m(15,i)=100: next

	'Дверь
	r = int(rnd*3)
	if r = 0 then m(int(rnd * 14) + 1, 0) = 50
	if r = 1 then m(0, int(rnd * 8) + 1) = 50
	if r = 2 then m(int(rnd * 14) + 1, 10) = 50
	if r = 3 then m(15, int(rnd * 8) + 1) = 50

	'Монетки
	for i = 1 to 5
		do
			x = int(rnd*14)+1
			y = int(rnd*8)+1
		loop until m(x,y)=0 
		m(x, y) = 10
	next
	
	'Колобок
	do
		x = int(rnd*14)+1
		y = int(rnd*8)+1
	loop until m(x,y)=0 
	m(x, y) = 1
	
	'Ключ
	do
		x = int(rnd*14)+1
		y = int(rnd*8)+1
	loop until m(x,y)=0 
	m(x, y) = 11
	
	cls
	DrawLevel(m)
	Game(m)
loop