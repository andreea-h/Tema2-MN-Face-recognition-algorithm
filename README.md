# Tema2-MN-Face-recognition-algorithm
Aplicatie are simuleaza un algoritm minimalist de recunoastere faciala:

In rezolvarea primei cerinte din tema, compresia imaginilor folosind descompunerea valorilor
singulare, am memorat in matricea image_matrix matricea asociata imaginii primite ca parametru
de functia task1, efectuand prelucrari asupra acesteia prin eliminarea liniilor si coloanelor
corespunzatoare din matricile U, S si V (rezultate din aplicarea functiei svd asupra matricii initiale).
Pentru obtinerea graficelor de la a doua cerinta a temei, am trimis ca parametru functiei task2 calea
catre imaginea din directorul “in” pentru care sunt reprezentate graficele, memorand apoi matricea
asociata imaginii in A, dimensiunile acesteia fiind de m linii respectiv n coloane. Pentru a salva
graficele obtinute in fisierul Readme am folosit comanda ‘print’ pentru a salva initial graficul intr-
un fisier cu extensia jpg si apoi am inserat aceste fisiere in Readme.

Graficele obtinute pentru cerinta 2, imaginea 2 sunt urmatoarele:
![alt text](https://github.com/andreea-h/Tema2-MN-Face-recognition-algorithm/blob/master/cerinta2_imaginea2.png)

Pentru realizarea graficului 2 am parcurs cu un index numerele de la 1 la dimensiunea vectorului k
predefinit, calculand la fiecare pas suma primelor k valori singulare ale matricei A respectiv suma
totala; am memorat raporturile obtinute intre cele 2 sume la fiecare pas (conform formulei) in
componentele unui vector de aceeasi dimensiune cu vectorul k. Pentru printarea graficului am
folosit comanda plot care primeste ca parametri principali vectorul valorilor de la axa Ox (vectorul
k) si vectorul valorilor de pe axa Oy (vectorul care memoreaza informatia la fiecare pas, calculata
anterior). Am procedat similar si in cadrul celorlalte grafice, memorand de fiecare data perechile de
puncte de forma (x,y) care trebuie reprezentate in componentele a 2 vectori, valoarea y calculandu-
se conform formulelor din enunt.Graficele obtinute pentru cerinta 2, imaginea 3, sunt urmatoarele:

![alt text](https://github.com/andreea-h/Tema2-MN-Face-recognition-algorithm/blob/master/cerinta2_imaginea3.png)

In rezolvarea task-ului 3 al temei, calculul valorilor singulare folosind metoda DVS, am parcurs
initial matricea A calculand pentru fiecare linie a sa suma elementelor, impartind apoi aceasta suma
la numarul de elemente de pe linie, mediile obtinute pentru toate liniile memorandu-se intr-un
vector. In final am calculat W si apoi A_k conform formulelor din enunt.
Pentru rezolvarea cerintei 4, calculul componentelor principale folosind un algoritm bazat pe
matricea de covarianta, am reluat pasii 1-2 exact ca la cerinta 3, apoi am calculat matricea de
covarianta Z conform formulei din enunt iar pentru a extrage in matricea W spatiul k-dimensional al
componentelor principale am folosit instructiunea eig (pentru a genera vectorii proprii asociati lui Z)
parcurgand apoi coloanele lui V si copiind primele k coloane in matricea V.
Pentru reprezentarea graficelor de la task-ul 5 am procedat similar cu task-ul 2, adaptand formulele
din enunt. Pentru realizarea tuturor graficelor am folosit valorile lui k din enuntul temei.
Graficele obtinute la task 5 pentru imaginea 2 sunt urmatoarele:

![alt enter](https://github.com/andreea-h/Tema2-MN-Face-recognition-algorithm/blob/master/task5_imaginea2.png)

Graficele obtinute pentru imaginea 3 (taskul 5) sunt urmatoarele:
![alt enter](https://github.com/andreea-h/Tema2-MN-Face-recognition-algorithm/blob/master/task5_imaginea3.png)

In cadrul ultimului task al temei, recunoasterea faciala, in prima functie de implemenat
( ‘eigenface_core(database_path)’ ) am considerat cunoscut faptul ca database_path va indica o cale
catre un director in care se afla 10 imagini; am observat ca pentru fiecare imagine matricea
corespunzatoare are dimensiunile 200x200, asa ca am folosit aceste date in implementare la
parcurgerea matricilor. De asemenea, daca fiecare matrice are dimensiunile 200x200, atunci
vectorul coloana asociat unei matrici va avea dimensiunea 400000x1, deci matricea T formata din
vectorii coloana (asociati celor 10 imagini) va avea dimensiunea 40000x10.
Pentru a citi toti vectorii asociati tuturor imaginilor am construit intr-un sir (‘image_path’) calea
catre fiecare imagine din directorul database_path, folosind instructiunea strcat pentru concatenarea
unor siruri astfel incat sa se obtina calea catre fiecare din cele 10 imagini. Apoi am construit
matricea A conform indicatiilor din enunt, cat si matricea V (parcurgand matricea valorilor proprii
pentru a determina apoi vectorii proprii corespunzatori valorilor proprii supraunitare).
In cadrul functiei ‘face_recognition(image_path, m, A, eigenfaces, pr_img)’ , la pasul 8, pentru a
determina imaginea din mutimea M cea mai asemanatoare cu imaginea de test pentru care se
apeleaza functia de face_recognition, am parcurs toate coloanele matricei ‘de proiectii’ (pr_img),
calculata in functia ‘eigenface_core’, calculand distanta de la fiecare vector coloana al acestei
matrici la proiectia imaginii de test (pr_test_img). Distanta minima va indica acea coloana din
pr_img asociata imaginii celei mai asemanatoare cu imaginea de test (pentru calculul distantelor am
folosit norm).
