function [A_k S] = task4(image, k)
 A=double(imread(image));
 [m n]=size(A);
 med=zeros(m,1);
 for i=1:m
  s=0;
  for j=1:n
    s=s+A(i,j);
  endfor
  med(i)=s/n; %vectorul med memoreaza media elementelor de pe fiecare linie a matricei A
 endfor
 for i=1:m
   for j=1:n
     A(i,j)=A(i,j)-med(i);
 endfor
 endfor
 Z=A*(A'/(n-1)); % Z este matricea de covarianta
 [V,S]=eig(Z);
 for i=1:k
   W(:,i)=V(:,i); % W este matricea cu primii k vectori proprii asociati matricei A
 endfor 
 Y=(W')*A;
 A_k=W*Y+med;
endfunction