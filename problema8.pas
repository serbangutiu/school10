{8. Scrieti subprograme care rezolva urmatoarele cerinte:
a. O functie care verifica daca un numar intreg transmis ca parametru se gaseste intr-un vector sau nu.
b. O functie care verifica daca elementele unui vector sunt sau nu distincte.
Folosind subprogramele de mai sus si altele daca sunt necesare, rezolvati urmatoarele probleme:
1. Se citesc doi vectori a si b cu na respectiv nb nalori intregi. Determinati daca fiecare vector contine elemente distincte, iar daca nu eliminati valorile multiple astfel incat sa ramana in vector fiecare valoare o singura data (devin multimi).
2. Afisati elementele comune celor doi vectori (intersectia celor doua multimi).
3. Afisati elementele multimii reuniune a celor doi vectori.
4. Afisati diferenta multimii a-b.}

program problema8;
type sir=array[1..200] of longint;

function apare(a:sir; n:byte; b:longint):boolean;
var i:byte;
	ok:boolean;
begin
	read(n);
	ok:=false;
	for i:=1 to n do begin
		read(a[i]);
		if a[i]=b then ok:=true;
		end;
	if ok=true then apare:=true
		else apare:=false;
end;

function toateElemDistincte(a:sir;n:longint):boolean;
var i,j:byte;
	ok:boolean;
begin
	read(n);
	i:=1;
	ok:=true;
	while (i<=n) and (ok=true) do begin
		for j:=i+1 to n do
			if a[i]=a[j] then ok:=false;
		i:=i+1;	
	end;
	if ok=true then toateElemDistincte:=true
		else toateElemDistincte:=false;
end;

function nraparente(a:sir; n:byte; nr:longint):byte;
var i,k:byte;
begin
	k:=0;
	for i:=1 to n do 
		if a[i]=nr then k:=k+1;
	
	nraparente:=k;	
end;


procedure citire(var a:sir;var n:byte);
var i:byte;
begin
	read(n);
	for i:=1 to n do 
		read(a[i]);
end;

procedure afisare(a:sir; n:byte);
var i:byte;
begin
	for i:=1 to n do 
		write(a[i],',','');
end;

procedure eliminare(var a:sir;var n:byte; nr:longint);
var i,j:byte;
	ok:boolean;
begin
	ok:=false;
	i:=1;
	while (i<= n) and (ok=false) do begin 
		if a[i]=nr then begin
			for j:=i to n do
				a[j]:=a[j+1];
			ok:=true;
		end;
		i:=i+1;
	end;
end;

procedure creareSirNou(a,b,ab:sir; na,nb:byte);
var i:byte;
begin
	for i:=1 to na+nb do
		if i<=na then
			ab[i]:=a[i]
			else ab[i]:=b[i-na];
end;	


var a,b,ab:array[1..200] of longint;
	na,nb,i,nab,k:byte;

begin
	citire(a,na);
	afisare(a,na);
	citire(b,nb);
	afisare(b,nb);
	
	if toateElemDistincte(a,na)=true then writeln('sirul a are elemente distincte')
		else begin
			for i:=1 to na do 
				while nraparente(a,na,a[i])>1 do
					eliminare(a,na,a[i]);
		end;	
		
	if toateElemDistincte(b,nb)=true then writeln('sirul b are elemente distincte')
		else begin
			for i:=1 to nb do 
				while nraparente(b,nb,b[i])>1 do
					eliminare(b,nb,b[i]);
		end;
	
	afisare(a,na);	
	afisare(b,nb);
	for i:=1 to na do
		if apare(b,nb,a[i])=true then write(a[i],',',' ');
		
	creareSirNou(a,b,ab,na,nb);
	nab:=na+nb;
	
	if toateElemDistincte(ab,nab)=true then afisare(ab,nab)
		else begin
			for i:=1 to nab do 
				while nraparente(ab,nab,ab[i])>1 do
					eliminare(ab,nab,ab[i]);
			afisare(ab,nab);		
		end;
		
		
	k:=0;
	for i:=1 to na do 
		if apare(b,nb,a[i])=false then k:=k+1;
		
	writeln('a-b=',k);	
	
end.
