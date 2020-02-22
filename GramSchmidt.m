% Mirciu Andrei-Constantin 313CD

function B = GramSchmidt(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
  % 'Q' este o matrice ortogonala, iar 'R' este superior triunghiulara
  % aflu numarul de linii si coloane ale matricei 'A'
  % https://www.mathworks.com/help/matlab/ref/size.html
	[m n]=size(A);
  % initializez matricea 'Q' cu valorile matricii 'A'
  Q = A;
  % initializez matricea 'R' cu 0-uri
	R = zeros(m,n);
	for k = 1:n
    % 'R' are pe diagonala principala norma euclidiana a vectorului coloana 'k' din 'Q'
    R(k,k) = norm(Q(1:m,k));
    % recalculez coloana 'k' din 'Q', impartind vechile valori la norma calculata anterior
		Q(1:m,k) = Q(1:m,k) ./ R(k,k);
    for j = k+1:n
      % calculez restul elementelor de pe linia 'k' din 'R' 
      R(k,j) = Q(1:m,k)' * Q(1:m,j);
      % recalculez restul coloanelor din 'Q'  
      Q(1:m,j) = Q(1:m,j) - Q(1:m,k) * R(k,j);
    end
	end
  
  % initializez vectorul necunoscutelor 'x'
  x = zeros(n,1);
  % formez matricea unitate
	I = eye(n);
  % extrag prima coloana din 'I'
	e = I(1:n,1);
  % 'Q' ortogonala, deci Q^(-1) = Q' 
	b = Q' * e;
  % rezolv primul sistem de ecuatii si obtin prima coloana din inversa matricii 'A'
	x = R \ b;
  % prima coloana a matricii 'B'
	B = x;
	for i = 2 : n
		x = zeros(n,1);
		e = I(1:n,i);
		b = Q' * e;
    % rezolv restul sistemelor de ecuatii
		x = R \ b;
    % adaug rezultatele la coloanele matricii B
    B = [B x];
	end
end