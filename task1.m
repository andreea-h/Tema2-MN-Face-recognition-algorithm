function [A_k S]= task1(image, k)
  %image_matrix este matricea corespunzatoare lui image
  image_matrix=double(imread(image));
  [U,S,V]=svd(image_matrix);
  [m n]=size(image_matrix);
  U(:,k+1:m)=[]; %se elimina din U coloanele de la k+1 la m
  S(k+1:m,:)=[]; %se elimina din S liniile de la k+1 la m
  S(:,k+1:n)=[]; %se elimina din S coloanele de la k+1 la n
  V=V';
  V(k+1:n,:)=[]; %se elimina din V' liniile de la k+1 la n
  A_k=U*S*V;
end