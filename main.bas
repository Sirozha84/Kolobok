#include <c:\Projects\Kolobok\fonts.bas>
#include <c:\Projects\Kolobok\graphics.bas>

poke 23561,10
poke 23562,1
poke 23693,7
paper 0
border 0
cls


'SetFont(0)
'print at 0,0;"priwet!"

dim m(16,10) as ubyte
for i = 0 to 15:m(i,0)=1:m(i,10)=1:next
for i = 0 to 10:m(0,i)=1:m(15,i)=1:next

SetFont(1)
for i = 0 to 15:for j = 0 to 10
if m(i,j)=0 then print at j*2,i*2;"..";at j*2+1,i*2;".."
if m(i,j)=1 then print at j*2,i*2;"!""";at j*2+1,i*2;"""!"
next: next


SetFont(1)

'for i = 0 to 1: for j = 0 to 3
'DrawKolobok(i*3,j*3,j,i)
'next:next

'pause 0: goto 1