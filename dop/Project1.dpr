﻿program lab1;

uses
  System.SysUtils,
  windows;

var a,b,h,x: Double;

//основная процедура считающая значение функции
function func(x: Double): Double;
const eps=1e-3;
var s,prev:double;n:integer;
 begin
s:=x;
prev:=x;
n:=1;
    while (abs(prev)>eps) do
    begin
      prev:=-prev*x*x/(n+1)/(n+2);
      s:=s+prev ;
      n:=n+2;
    end;
    result:=x*x-2*x-s
 end;

begin
    //установка кириллицы в консоли
	SetConsoleCP(1251);
  	SetConsoleOutputCP(1251);

    //получаем данные из консоли
    writeln('Введите число a');
    readln(a);
    writeln('Введите число b');
    readln(b);
    writeln('Введите число h');
    readln(h);
    //начальный вывод
    writeln('значение x':10, '|значение y');
    //проверка
    if a=b then
    	writeln(a:10:3,'|',func(a):10:5)
    else
    	if ((a>b) and (h>0))
    	or ((a<b) and (h<0))
    	or (h=0)
    	or (Abs(b-a)<=Abs(h)) then
    		begin
            	writeln(a:10:3,'|',func(a):10:5);
            	writeln(b:10:3,'|',func(b):10:5);
    		end
    	else
        	begin
        		x:=a;
                if (h>0) then
                	begin
             			while (x<=b-0.0001) and (x<>b) do
             				begin
                				writeln(x:10:3,'|',func(x):10:5);
                				x:=x+h;
             				end;
        			end
    			else
        			begin
             			while (x>=b+0.0001) and (x<>b) do
             				begin
                				writeln(x:10:3,'|',func(x):10:5);
                				x:=x+h;
             				end;

        			end;
                writeln(b:10:3,'|',func(b):10:5)
             end;
  readln;
end.
