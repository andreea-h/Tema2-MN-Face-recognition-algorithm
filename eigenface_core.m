function [m A eigenfaces pr_img] = eigenface_core(database_path)
  T=zeros(40000,10); %% T este matricea care retine valorile din matricile asociate imaginilor
  for i=1:10
    image_path=strcat(database_path,'/',int2str(i),'.jpg');
    matrix=double(rgb2gray(imread(image_path)));
    e=1;
    vect=zeros(40000,1);
    for j=1:200
      for k=1:200
        vect(e)=matrix(j,k); %% vect este vectorul asociat matricei matrix corespunzatoare unei imagini
        e++;
      endfor
    endfor
    T(:,i)=vect; %%pentru fiecare imagine i este copiat vectorul coloana asociat in coloana i din matricea T
  endfor
  m=zeros(40000,1); %%vectorul coloana m memoreaza media elementelor de pe fiecare linie a matricei T
  for i=1:40000
    s=0;
    for j=1:10
      s=s+T(i,j);
    endfor
    m(i)=s/10;
  endfor
  A=T-m;
  B=A'*A;
  [W S]=eig(B); 
  k=1; %%k va contoriza numarul de coloane am matricei V (deci numarul valorilor proprii>1 din matricea B)
  for i=1:10
    if(S(i,i)>1) %%daca valoarea proprie memorata pe linia i si coloana i este supraunitara
        V(:,k)=W(:,i); %%se copiaza in matricea V vectorul propriu (din matricea W) corespunzator unei valori proprii >1
        k++;
    endif
  endfor
  eigenfaces=A*V; %%eigenfaces este matricea fetelor proprii
  pr_img=eigenfaces'*A; %%matricea pr_img va memora pe fiecare coloana a sa 
                        %%     proiectia fiecarei imagini din multimea initiala in spatiul fetelor
end