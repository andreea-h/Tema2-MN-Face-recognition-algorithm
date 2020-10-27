function task5(image)
%%%%%%%%% graficul 1
  figure;
  A=double(imread(image));
  [m n]=size(A); 
  k=[1:19 20:20:99 100:30:min(m,n)];
  [A_k S Z] = task3(image, k);
  subplot(2,2,1); %permite printarea a 4 grafice in cadrul aceleiasi figuri
  plot(diag(S),'Color',[1 0 1],'linewidth', 1.25);
%%%%%%%%% graficul 2
  info=zeros(size(k,2),1);
  for index=1:size(k,2)
    [A_k S Z]= task3(image,k(index));
    s1=0;
    for i=1:k(index)
      s1=s1+S(i,i);
    endfor
    s2=0;
    [U,S,V]=svd(Z);
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
    A_k=task3(image,k(indice));
    for i=1:m
      suma=0;
      for j=1:n
        suma=suma+(A(i,j)-A_k(i,j))^2;
      endfor
      Sum(indice)=Sum(indice)+suma;
    endfor
  endfor
  Sum=Sum/(m*n);
  subplot(2,2,3);
  plot(k,Sum,'Color',[1 0 1],'linewidth', 1.25);
%%%%%%%%% graficul 4
  for j=1:size(k,2)
    val4(j)=(2*k(j)+1)/n;
  endfor
  subplot(2,2,4);
  plot(k,val4,'Color',[1 0 1],'linewidth', 1.25);
  print('image5.jpg');
end