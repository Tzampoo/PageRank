% Mirciu Andrei-Constantin 313CD

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  % deschid fisierul primit de functie ca parametru pentru citire
  fid = fopen(nume, 'rt');
  % citesc din fisier numarul de pagini web ('N')
  N = fscanf(fid, '%f', 1);
  % citesc din fisier restul informatiilor si le organizez intr-o matrice
  % https://www.mathworks.com/help/matlab/ref/dlmread.html
  data = dlmread(fid);
  % extrag din matricea obtinuta elementele ce reprezinta numarul nodului 'i'
  Nr = data([2:N+1],[1]);
  % extrag din matricea obtinuta elementele ce reprezinta numarul de noduri cu care se invecineaza nodul 'i'
  Li = data([2:N+1],[2]);
  % extrag din matricea obtinuta elementele ce reprezinta nodurile cu care se invecineaza nodul 'i'
  V = data([2:N+1],[3:N]);
  % 'A' reprezinta matricea de adiacenta a grafului alcatuit din cele 'N' pagini web
  % initializez 'A' cu elemente de 0
  A = zeros(N);
  
  for i = 1:N
    for j = 1:N-2
      % extrag din vectorul coloana 'Nr' numarul de ordine al nodului 'i'
		  nod = Nr(i,1);
      % extrag din matricea 'V' doar vecinii nodului 'i'
		  vecini = V(i,:);
      % transform 'vecini' din vector linie in vector coloana
      b = vecini(:);
      % deoarece dlmread adauga 0-uri ca padding , trebuie sa verific ca elementele lui 'b' sa fie diferite de 0 
      if b(j,1) != 0
        % formez matricea 'A'
        A(nod,V(i,j)) = 1;
      end
	  end
  end
  % elementele de pe diagonala principala a matricii 'A' sunt 0
  for i=1:N
    A(i,i)=0;
  end
  % calculez gradele de iesire ale fiecarui nod
  % https://www.mathworks.com/help/matlab/ref/sum.html
  % https://www.mathworks.com/help/matlab/ref/transpose.html  
  iesire = sum(A');
  % formez matricea 'K'
  K = diag(iesire);
  % calculez inversa matricii 'K'
  Kinversa = diag(1./iesire);
  % initializez vectorul 'R' cu valoarea 1/N
	R(1:N,1) = 1/N;
  % calculez matricea 'M'
	M = (Kinversa * A)';
  do 
	  tmp = R;
		R = d * M * tmp + ((1 - d)/N) * (ones(N,1));
    % am pus if-ul pentru a returna valoarea R(t), altfel era returnata valoarea R(t+1)
    % http://cs.curs.pub.ro/2017/mod/forum/discuss.php?d=2697#p9489
    if (norm(R-tmp) < eps) 
      R = tmp;
      return
  end
  % https://www.mathworks.com/help/matlab/ref/norm.html
  until (norm(R - tmp) < eps)
  % http://cs.curs.pub.ro/2017/mod/forum/discuss.php?d=2766#p10169
  output_precision(6);
  % inchid fisierul deschis pentru citire
  fclose(fid);
end  