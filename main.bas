#include <c:\Projects\Kolobok\fonts.bas>
#include <c:\Projects\Kolobok\game.bas>
#include <c:\Projects\Kolobok\graphics.bas>

ScreenClear()

'SetFont(0)
'print at 0,0;"priwet!"

dim m(16,10) as byte
for i = 0 to 15: m(i,0)=100: m(i,10)=100: next
for i = 0 to 10: m(0,i)=100: m(15,i)=100: next
m(2, 5) = 1
m(15, 5) = 50

m(2, 6) = 10
m(4, 4) = 10
m(8, 2) = 10
m(10, 5) = 10
m(12, 7) = 10

DrawLevel(m)
Game(m)