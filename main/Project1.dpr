﻿program Project1;

uses
  System.SysUtils, Math;

var i,k: integer;
x,f1,f2,prevTerm,currTerm, sum1,prevSum1,prevSum2, sum2:double;
flag1,flag2: boolean;
const eps=0.0001;
begin
    x:=-0.6;
writeln('|       |           |        E=10^-2      |        E=10^-3      |        E=10^-4      |');
writeln('|   x   |   f1(x)   |_____________________|_____________________|_____________________|');
writeln('|       |           |    f2(x)  |    N    |    f2(x)  |    N    |    f2(x)  |    N    |');
writeln('|_______|___________|___________|_________|___________|_________|___________|_________|');
    for i := 1 to 20 do
         begin
         flag1:=true;
         flag2:=true;
         f2:=0;
         prevTerm:=-x*x/2;
         prevSum1:=0;
         prevSum2:=0;
         k:=1;

         if (abs(x)<1E-14) then
         begin
             writeln('|',x:6:2,'|':2, f1:9:6,'|':3, f2:9:6, '|':3, (k):6, '|':4, f2:9:6, '|':3, (k):6, '|':4, f2:9:6, '|':3, (k):6, '|':4);
             writeln('|_______|___________|___________|_________|___________|_________|___________|_________|');
           x:=x+0.05;
           continue;
         end;

         f1:=1/6*Power(ln(1+x),3);
         write('|',x:6:2,'|':2, f1:9:6,'|':3);
          repeat
                sum2:=(prevSum2+1/k);
                sum1:=(prevSum1+1/(k+1)*(prevSum2+1/k));
                if (prevSum1=0) then
           		currTerm:=-prevTerm*x*sum1*(k+1)/(k+2)
                else currTerm:=-prevTerm*x*sum1*(k+1)/(k+2)/prevSum1;
                prevSum2:=sum2;
                prevSum1:=sum1;
           		f2:=f2+currTerm;
           		prevTerm:=currTerm;
                if (abs(prevTerm)<eps*100) and (flag1=true) then
                    begin
                        write(f2:9:6, '|':3, (k):6, '|':4);
                        flag1:=false
                    end;
                if (abs(prevTerm)<eps*10) and (flag2=true) then
                    begin
                        write(f2:9:6, '|':3, (k):6, '|':4);
                        flag2:=false
                    end;
                k:=k+1;
            until abs(prevTerm)<eps;
             writeln(f2:9:6, '|':3, (k-1):6, '|':4);
             writeln('|_______|___________|___________|_________|___________|_________|___________|_________|');
           x:=x+0.05;
         end;
readln;
end.
