{9. .Scrieti subprograme care rezolva urmatoarele cerinte:
a. Determina cel mai mare divizor comun a 2 numere naturale
b. Determina cel mai mare divizor al unui numar natural, divizor mai mic decat numarul parametru
c. Determina suma divizorilor proprii unui numar dat.
Folosind subprogramele de mai sus si altele daca sunt necesare, rezolvati urmatoarele probleme:
1. Pentru numerele unui vector afisati cel mai mare divizor comun al tuturor perechilor de valori.
2. Calculati si afisati cel mai mare divizor comun al tuturor numerelor din vector.
3. Afisati numerele prime din vector.
4. Afisati perechile de numere vecine din vector care sunt prime intre ele.
5. Afisati numerele din vector care sunt formate din produsul a doua numere prime.
6. Afisati perechile de numere din vector care au aceeasi suma a divizorilor.
7. Afisati numerele perfecte din vector (un numar este perfect daca este egal cu suma divizorilor sai mai mici decat el).}
program problema9;
type sir=array[1..200] of longint;

function cmmdc(a,b:longint):longint;
var r:longint;
begin
	while b<>0 do begin
		r:=a mod b;
		a:=b;
		b:=r;
	end;
	cmmdc:=a;
end;
	


function maxDivNr(a:longint):longint;
var max,d:longint;
begin
	max:=1;
	for d:=2 to a div 2 do 
		if a mod d=0 then max:=d;
end;

function sumaDivProprii(a:longint):longint;
var sum,d:longint
begin
	sum:=0;
	for d:=2 to a div 2 do
		if a mod d=0 then sum:=sum+d;
end;

function cmmdSir(a:sir;n:byte):longint;
var d,divSir,min:longint;
	i,n:byte;
	ok:boolean;
begin
	min:=10000;
	for i:=1 to n do 
		if a[i]<min then min:=a[i];
	
	for d:=1 to min do begin
		i:=1;
		ok:=true;
		while (i<=n) and (ok=true) do begin
			if a[i] mod d<>o then ok:=false
				else divSir:=d;
			i:=i+1;	
		end;
		if ok=true then cmmdSir:=divSir;
	end;
end;	
	
	
procedure citire(var a:sir;var n:byte);
var i:byte;
begin
	read(n);
	for i:=1 to n do 
		read(a[i]);
end;


procedure afisare(a:sir; n:byte);
var i,j:byte;
begin
	for i:=1 to n do 
		write(a[i],',',' ');
end;


var a:array[1..200] of longint;
	n,i:byte;
begin{programul principal}
	
	citire(a,n);
	afisare(a,n);
	writeln('cel mai mare divizor al tuturor elementelor din sir este',' ',cmmdSir(a,n));
	
	writeln('numerele prime din sir sunt:',' ');
	for i:=1 to n do
		if sumaDivProprii(a[i])=0 then write(a[i],' ',',');
		

	writeln('perechile de numere prime intre ele din sir sunt:',' ');
	for i:= 1 to n-1 do
		if cmmdc(a[i],a[i+1])=1 then write('(',a[i],',',' ',a[i+1],')');
		
	
	writeln('numerele care sunt formate din produsul a 2 nr prime sunt:',' ');
	for i:=1 to n do
		if (sumaDivProprii(a[i])=maxDivNr(a[i])+a[i] div maxDivNr(a[i])) and (maxDivNr(a[i])=1) and (maxDivNr(a[i] div maxDivNr(a[i]))=1) then
			write(a[i],',',' ');
			
	writeln('perechile de numere care au acelasi nr de divizori sunt',' ');
	for i:=1 to n do
		for j:=i to n do
			if sumaDivProprii(a[i])=sumaDivProprii(a[j]) then write('(',a[i],',',' ',a[j],')');


	writeln('numerele perfecte din sir sunt:',' ');
	for i:=1 to n do
		if sumaDivProprii(a[i])+1=a[i] then write(a[i],',',' ');


end.
