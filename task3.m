function [A_k S Z] = task3(image, k)
 %se calculeaza media elementelor de pe fiecare linie a matricei
 A=double(imread(image));
 [m n]=size(A);
 med=zeros(m,1); %med este vectorul care memoreaza mediile de pe fiecare linie
 for i=1:m
  s=0;
  for j=1:n
    s=s+A(i,j);  %s reprezinta suma elementelor de pe o linie a matricei
  endfor
  med(i)=s/n;
 endfor
 %se recalculeaza valorile din matrice
 for i=1:m
  for j=1:n
    A(i,j)=A(i,j)-med(i);
  endfor
 endfor
 Z=zeros(n,m);
 Z=A'/sqrt(n-1);
 W=zeros(m,k);
 [U,S,V]=svd(Z);
 %se contruieste matricea W cu primele k coloane din matricea V
 for i=1:k
    W(:,i)=V(:,i);
 endfor
 Y=W'*A;
 A_k=W*Y+med; %se aproximeaza matricea initiala
endfunction