#include <c:\Projects\Kolobok\fonts.bas>
#include <c:\Projects\Kolobok\game.bas>
#include <c:\Projects\Kolobok\graphics.bas>

poke 23561,10
poke 23562,1
poke 23693,7
paper 0
border 0
cls

'SetFont(0)
'print at 0,0;"priwet!"

dim m(16,10) as byte
for i = 0 to 15: m(i,0)=100: m(i,10)=100: next
for i = 0 to 10: m(0,i)=100: m(15,i)=100: next
m(15, 5) = 50

DrawLevel(m)
Game(m,2,5)
