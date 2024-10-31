package codigo;

import java_cup.runtime.Symbol;

%%
%class Cup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

{espacio} {/*Ignore*/}

case {return new Symbol(sym.Caso, yychar, yyline, yytext());}

if |
switch |
try |
evaluar |
yield {return new Symbol(sym.Evaluar, yychar, yyline, yytext());}

for {return new Symbol(sym.CicloF, yychar, yyline, yytext());}

foreach |
do |
while {return new Symbol(sym.CicloD, yychar, yyline, yytext());}

"=" {return new Symbol(sym.Igual, yychar, yyline, yytext());}

"<" |
">" |
"!" |
"==" |
"!=" |
">=" |
"<=" {return new Symbol(sym.OperadorRelacional, yychar, yyline, yytext());}

else {return new Symbol(sym.OtroCasoUlt, yychar, yyline, yytext());}

elseif |
elif |
otherwise {return new Symbol(sym.OtroCaso, yychar, yyline, yytext());}

int |
float |
string |
char |
bool |
array |
long |
text |
str |
dynamic |
unsigned |
pointer |
struct |
enum |
date |
time |
datetime |
money |
decimal |
matrix |
object |
long |
double {return new Symbol(sym.Tipo, yychar, yyline, yytext());}

or |
and |
xor |
not |
"&&" {return new Symbol(sym.Logico, yychar, yyline, yytext());}

"//" |
"/*" |
"*/" |
"###" {return new Symbol(sym.Comentario, yychar, yyline, yytext());}

toint |
tofloat |
tostring |
tochar |
tobool |
toarray |
tolong |
totext |
tostr |
todynamic |
tounsigned |
topointer |
tostruct |
toenum |
todate |
totime |
todatetime |
tomoney |
todecimal |
tomatrix |
toobject |
tolong |
todouble {return new Symbol(sym.Convertir, yychar, yyline, yytext());}

abs |
power |
area |
isprime |
log |
sum |
div |
diff |
mod |
exp |
log10 |
sqrt |
factorial {return new Symbol(sym.Funciones, yychar, yyline, yytext());}

sin |
con |
tan |
acos |
atan |
asin |
pi |
radiant |
degrees |
hypot {return new Symbol(sym.Trigonometria, yychar, yyline, yytext());}

public |
local |
abstract |
protected |
global |
notlocal {return new Symbol(sym.Acceso, yychar, yyline, yytext());}

"++" |
"--" {return new Symbol(sym.Incremento, yychar, yyline, yytext());}

"+" {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Por, yychar, yyline, yytext());}
"/" {return new Symbol(sym.Dividido, yychar, yyline, yytext());}

"%" |
"^" {return new Symbol(sym.Matematico, yychar, yyline, yytext());}

input |
scan {return new Symbol(sym.Leer, yychar, yyline, yytext());}

clear |
clc {return new Symbol(sym.Limpia, yychar, yyline, yytext());}

xeti |
yeti |
zeti |
label | 
loop_label | 
for_label | 
statement_label | 
instruction_label | 
funtion_label | 
funtion_tag | 
case_label | 
switch_label {return new Symbol(sym.Etiqueta, yychar, yyline, yytext());}

min |
max |
size |
prod |
sort |
sortmax |
sortmin |
primes |
count |
ascending |
descending |
into {return new Symbol(sym.Array, yychar, yyline, yytext());}

equal |
typeof |
is |
unless |
notnull |
gettype |
contains |
match |
in |
null |
"??" |
"?" |
"??=" {return new Symbol(sym.Expresiones, yychar, yyline, yytext());}

lenght {return new Symbol(sym.Longitud, yychar, yyline, yytext());}

close {return new Symbol(sym.Cerrar, yychar, yyline, yytext());}

random {return new Symbol(sym.Aleatorio, yychar, yyline, yytext());}

from {return new Symbol(sym.Desde, yychar, yyline, yytext());}

import {return new Symbol(sym.Importar, yychar, yyline, yytext());}

print {return new Symbol(sym.Imprimir, yychar, yyline, yytext());}

catch |
throw |
default {return new Symbol(sym.Excepcion, yychar, yyline, yytext());}

true |
false {return new Symbol(sym.EvaluacionLog, yychar, yyline, yytext());}

return |
break |
continue |
goto {return new Symbol(sym.Salto, yychar, yyline, yytext());}

add |
remove |
reverse |
cloneo {return new Symbol(sym.OpListas, yychar, yyline, yytext());}

stack {return new Symbol(sym.Pila, yychar, yyline, yytext());}

main {return new Symbol(sym.Principal, yychar, yyline, yytext());}

trim |
touppercase |
trimend |
trimstart |
tolowercase | 
split | 
slice | 
substring {return new Symbol(sym.Cadena, yychar, yyline, yytext());}

"(" {return new Symbol(sym.AbriPar, yychar, yyline, yytext());}

")" {return new Symbol(sym.CierraPar, yychar, yyline, yytext());}

"[" {return new Symbol(sym.AbriCor, yychar, yyline, yytext());}

"]" {return new Symbol(sym.CierraCor, yychar, yyline, yytext());}

"{" {return new Symbol(sym.AbriLla, yychar, yyline, yytext());}

"}" {return new Symbol(sym.CierraLla, yychar, yyline, yytext());}

"|" {return new Symbol(sym.Agrupacion, yychar, yyline, yytext());}

";" |
":" {return new Symbol(sym.TerminarIns, yychar, yyline, yytext());}

as {return new Symbol(sym.Alias, yychar, yyline, yytext());}

select {return new Symbol(sym.Seleccionar, yychar, yyline, yytext());}

event {return new Symbol(sym.Evento, yychar, yyline, yytext());}

image {return new Symbol(sym.Imagen, yychar, yyline, yytext());}

todo |
fixme |
note |
hack |
xxx |
bug |
review |
optimize |
deprecated |
security {return new Symbol(sym.ComentarioEspecifico, yychar, yyline, yytext());}

"<<" |
">>" |
"<<<" |
">>>" {return new Symbol(sym.Desplazamiento, yychar, yyline, yytext());}

"&=" |
"|=" {return new Symbol(sym.BitAsignacion, yychar, yyline, yytext());}

"...." {return new Symbol(sym.Elipse, yychar, yyline, yytext());}

"," {return new Symbol(sym.Coma, yychar, yyline, yytext());}

clone |
copy {return new Symbol(sym.Clonacion, yychar, yyline, yytext());}

sizeof |
len |
siz |
strlen |
capacity |
filesize {return new Symbol(sym.Tamano, yychar, yyline, yytext());}

fun {return new Symbol(sym.Fun, yychar, yyline, yytext());}

union |
intersect |
except |
difference |
complement {return new Symbol(sym.Conjunto, yychar, yyline, yytext());}

map |
flatmap |
selectmany |
filter |
reduce |
zip |
groupby {return new Symbol(sym.Flujo, yychar, yyline, yytext());}

new |
delete |
malloc |
free |
alloca {return new Symbol(sym.Memoria, yychar, yyline, yytext());}

find |
filter {return new Symbol(sym.Busqueda, yychar, yyline, yytext());}

file |
open |
closea |
read |
write |
streamreader |
streamwriter {return new Symbol(sym.Archivo, yychar, yyline, yytext());}

thread |
mutex |
task |
async |
await {return new Symbol(sym.Concurrencia, yychar, yyline, yytext());}

lock |
monitor |
synchronized {return new Symbol(sym.Sincronizacion, yychar, yyline, yytext());}

messagequeue |
enqueuem |
dequeue |
send |
receive |
message {return new Symbol(sym.Mensaje, yychar, yyline, yytext());}

task |
chunk |
work_item {return new Symbol(sym.Granuladidad, yychar, yyline, yytext());}

hidetur |
showtur |
speedtur |
shapetur |
visibletur |
colortur {return new Symbol(sym.Optur, yychar, yyline, yytext());}

forward |
backward |
right |
left |
distance |
setx |
sety |
corx |
cory |
home |
reset {return new Symbol(sym.Dirtur, yychar, yyline, yytext());}

pendown |
penup |
pencolor |
pensize |
draw |
stamp |
clearstamp {return new Symbol(sym.Pentur, yychar, yyline, yytext());}

fillcolor |
fillgradient |
fillmaterial |
fillbg |
fillend {return new Symbol(sym.Rellenar, yychar, yyline, yytext());}

{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

[-+]?{D}|{D}* [.]?{D} {return new Symbol(sym.Numero, yychar, yyline, yytext());}

\"[^\"\n]*\"  {return new Symbol(sym.Literal, yychar, yyline, yytext());}

{D}+{L}* |. {return new Symbol(sym.ERROR, yychar, yyline, yytext());}