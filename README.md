# PageRank
Realized a simplified version of the PageRank algorithm in Matlab. It is used by Google search engine to calculate the relevancy of a web page.

In rezolvarea temei de casa, pentru calculul vectorului de PageRank-uri am folosit doi algoritmi: 
Iterative, respectiv Algebraic. 
	Primul algoritm poate fi implementat in doua moduri diferite, folosind relatii de recurenta. Am preferat sa folosesc forma matriceala deoarece aceasta imi era necesara si pentru algoritmul Algebraic. Inainte de a incepe aflarea propriu-zisa a vectorului R, am calculat matricea de adiacenta A, respectiv matricea M (matrice stochastica). Algoritmul se opreste atunci cand norma euclidiana a diferentei dintre vectorul R la momentul t + 1 si momentul t este mai mica decat o anumita toleranta.
  
Al doilea algoritm este destul de asemanator cu primul, singura deosebire fiind faptul ca 
relatia de recurenta dispare. Avand in vedere ca algoritmul necesita aflarea inversei unei matrici, 
folosesc procedeul Gram-Schmidt modificat pentru a descompune matricea in forma Q * R, dupa care 
rezolv n sisteme de ecuatii si formez inversa. Mentionez ca algoritmul Gram-Schmidt modificat 
l-am preluat de pe platforma Moodle a facultatii (http://cs.curs.pub.ro/2017/mod/folder/view.php?id=5406), 
iar pentru rezolvarea unui sistem de ecuatii folosesc operatorul Matlab '\\'.

La cerinta a treia, pentru a calcula gradul de apartenenta al paginilor web, functia u(x) trebuie sa fie continua. Proprietatea de continuitate trebuie studiata in punctele val1, respectiv val2. Astfel, o functie este continua intr-un anumit punct daca si numai daca limita la stanga din u(x) in acel punct este egala cu limita la dreapta din u(x) in acel punct si egala cu valoarea functiei in acel punct. Dupa cateva calcule simple, se obtine ca a * val1 + b = 0 si a * val2 + b = 1.
  
Rezulta ca b = - a * val1, iar din a * val2 - a * val1 = 1 obtin a = 1 / (val2 - val1), 
b = - val1 / (val2 - val1).

In final, pentru ca tema sa poata fi testata cu ajutorul checker-ului, am realizat fisierul 
PageRank.m. Acesta calculeaza valorile vectorului R atat prin intermediul algoritmului Iterative, 
cat si Algebraic. Sortez descrescator vectorul R calculat cu algoritmul Algebraic si aflu gradul 
de apartenenta al fiecarei pagini web prin intermediul functiei realizate la cerinta a treia. 
Mentionez ca pentru a retine indexul paginii cu un anumit grad de apartenenta folosesc o
optiune disponibila a functiei de sortare (sort). Rezultatele finale sunt trecute intr-un 
nou fisier.

In fisierele sursa am atasat link-uri catre resursele folosite.
