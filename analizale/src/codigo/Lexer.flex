package codigo;

import static codigo.Tokens.*;

%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r]+
%{
    public String lexeme;
%}
%%

{espacio} {/*Ignore*/}

case {lexeme=yytext(); return Caso;}

if |
switch |
try |
evaluar |
yield {lexeme=yytext(); return Evaluar;}

for {lexeme=yytext(); return CicloF;}

foreach |
do |
while {lexeme=yytext(); return CicloD;}

"=" {lexeme=yytext(); return Igual;}

"<" |
">" |
"!" |
"==" |
"!=" |
">=" |
"<=" {lexeme=yytext(); return OperadorRelacional;}

else {lexeme=yytext(); return OtroCasoUlt;}

elseif |
elif |
otherwise {lexeme=yytext(); return OtroCaso;}

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
double {lexeme=yytext(); return Tipo;}

or |
and |
xor |
not |
"&&" {lexeme=yytext(); return Logico;}

"//" |
"/*" |
"*/" |
"###" {lexeme=yytext(); return Comentario;}

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
todouble {lexeme=yytext(); return Convertir;}

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
factorial {lexeme=yytext(); return Funciones;}

sin |
con |
tan |
acos |
atan |
asin |
pi |
radiant |
degrees |
hypot {lexeme=yytext(); return Trigonometria;}

public |
local |
abstract |
protected |
global |
notlocal {lexeme=yytext(); return Acceso;}

"++" |
"--" {lexeme=yytext(); return Incremento;}

"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Por;}
"/" {lexeme=yytext(); return Dividido;}

"%" |
"^" {lexeme=yytext(); return Matematico;}

input |
scan {lexeme=yytext(); return Leer;}

clear |
clc {lexeme=yytext(); return Limpia;}

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
switch_label {lexeme=yytext(); return Etiqueta;}

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
into {lexeme=yytext(); return Array;}

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
"??=" {lexeme=yytext(); return Expresiones;}

lenght {lexeme=yytext(); return Longitud;}

close {lexeme=yytext(); return Cerrar;}

random {lexeme=yytext(); return Aleatorio;}

from {lexeme=yytext(); return Desde;}

import {lexeme=yytext(); return Importar;}

print {lexeme=yytext(); return Imprimir;}

catch |
throw |
default {lexeme=yytext(); return Excepcion;}

true |
false {lexeme=yytext(); return EvaluacionLog;}

return |
break |
continue |
goto {lexeme=yytext(); return Salto;}

add |
remove |
reverse |
cloneo {lexeme=yytext(); return OpListas;}

stack {lexeme=yytext(); return Pila;}

main {lexeme=yytext(); return Principal;}

trim |
touppercase |
trimend |
trimstart |
tolowercase | 
split | 
slice | 
substring {lexeme=yytext(); return Cadena;}

"(" {lexeme=yytext(); return AbriPar;}

")" {lexeme=yytext(); return CierraPar;}

"[" {lexeme=yytext(); return AbriCor;}

"]" {lexeme=yytext(); return CierraCor;}

"{" {lexeme=yytext(); return AbriLla;}

"}" {lexeme=yytext(); return CierraLla;}

"|" {lexeme=yytext(); return Agrupacion;}

";" |
":" {lexeme=yytext(); return TerminarIns;}

as {lexeme=yytext(); return Alias;}

select {lexeme=yytext(); return Seleccionar;}

event {lexeme=yytext(); return Evento;}

image {lexeme=yytext(); return Imagen;}

todo |
fixme |
note |
hack |
xxx |
bug |
review |
optimize |
deprecated |
security {lexeme=yytext(); return ComentarioEspecifico;}

"<<" |
">>" |
"<<<" |
">>>" {lexeme=yytext(); return Desplazamiento;}

"&=" |
"|=" {lexeme=yytext(); return BitAsignacion;}

"...." {lexeme=yytext(); return Elipse;}

"," {lexeme=yytext(); return Coma;}

clone |
copy {lexeme=yytext(); return Clonacion;}

sizeof |
len |
siz |
strlen |
capacity |
filesize {lexeme=yytext(); return Tamano;}

fun {lexeme=yytext(); return Fun;}

union |
intersect |
except |
difference |
complement {lexeme=yytext(); return Conjunto;}

map |
flatmap |
selectmany |
filter |
reduce |
zip |
groupby {lexeme=yytext(); return Flujo;}

new |
delete |
malloc |
free |
alloca {lexeme=yytext(); return Memoria;}

find |
filter {lexeme=yytext(); return Busqueda;}

file |
open |
closea |
read |
write |
streamreader |
streamwriter {lexeme=yytext(); return Archivo;}

thread |
mutex |
task |
async |
await {lexeme=yytext(); return Concurrencia;}

lock |
monitor |
synchronized {lexeme=yytext(); return Sincronizacion;}

messagequeue |
enqueuem |
dequeue |
send |
receive |
message {lexeme=yytext(); return Mensaje;}

task |
chunk |
work_item {lexeme=yytext(); return Granuladidad;}

hidetur |
showtur |
speedtur |
shapetur |
visibletur |
colortur {lexeme=yytext(); return Optur;}

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
reset {lexeme=yytext(); return Dirtur;}

pendown |
penup |
pencolor |
pensize |
draw |
stamp |
clearstamp {lexeme=yytext(); return Pentur;}

fillcolor |
fillgradient |
fillmaterial |
fillbg |
fillend {lexeme=yytext(); return Rellenar;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

[-+]?{D}|{D}* [.]?{D} {lexeme=yytext(); return Numero;}

\"[^\"\n]*\"  {lexeme=yytext(); return Literal;}

{D}+{L}* |. {lexeme=yytext(); return ERROR;}