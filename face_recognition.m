function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
   vect=zeros(40000,1); %%vect este vectorul coloana asociat imaginii de test
   img=double(rgb2gray(imread(image_path))); %%img este matricea asociata imaginii
   k=1; %%k va memora numarul de linii al vectorului coloana asociat lui img
   for i=1:200
     for j=1:200
       vect(k)=img(i,j);
       k++;
     endfor
   endfor
  vect=vect-m;
  pr_test_img=(eigenfaces')*vect; %%proiectia imaginii de test in spatiul fetelor
  min_dist=Inf;
  for i=1:10 %%se parcurge fiecare coloana a matricei ce memoreaza proiectiile imaginilor
    if (norm(pr_test_img-pr_img(:,i))<min_dist) %%se determina distanta minima
      min_dist=norm(pr_test_img-pr_img(:,i));  
      output_img_index=i;
     endif
  endfor
end