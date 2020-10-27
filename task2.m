function task2(image)
%%%%%%%% graficul 1
  figure;
  A=double(imread(image)); %A este matricea asociata imaginii citite
  [m,n]=size(A);
  val1=svd(A); %%valorile singulare ale matricei A
  subplot(2,2,1);
  plot([1:size(val1)],val1,'Color',[1 0 1],'linewidth', 1.25);
%%%%%%%%% graficul 2
  k=[1:19 20:20:99 100:30:min(m,n)];
  info=zeros(size(k,2),1); %info este vectorul care memoreaza 'informatia' calculata conform formulei
  for index=1:size(k,2)
    [A_k S]= task1(image,k(index));
    s1=0;
    for i=1:k(index)
      s1=s1+S(i,i);
    endfor
    s2=0;
    [U,S,V]=svd(A);
    for j=1:min(m,n)
      s2=s2+S(j,j);
    endfor
    info(index)=s1/s2;
  endfor
  subplot(2,2,2);
  plot(k,info,'Color',[1 0 1],'linewidth', 1.25);
%%%%%%%%% graficul 3
  Sum=zeros(size(k,2),1);
  for indice=1:size(k,2)
    A_k=task1(image,k(indice));
    for i=1:m
      suma=0;
      for j=1:n
        suma=suma+(A(i,j)-A_k(i,j))^2;
      endfor
      Sum(indice)=Sum(indice)+suma;
    endfor
  endfor
  Sum=Sum/(m*n); %%vectorul Sum va memora eroarea aproximarii calculata
  subplot(2,2,3);
  plot(k,Sum,'Color',[1 0 1],'linewidth', 1.25);
%%%%%%%%% graficul 4
  for j=1:size(k,2)  %%vectorul val4 memoreaza rata de compresie a datelor
    val4(j)=(m*k(j)+n*k(j)+k(j))/(m*n);
  endfor
  subplot(2,2,4);
  plot(k,val4,'Color',[1 0 1],'linewidth', 1.25);
  print('image.jpg');
end