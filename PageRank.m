% Mirciu Andrei-Constantin 313CD

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
	fid_out = fopen(strcat(nume, '.out'), 'wt');
  R1 = Iterative(nume, d, eps);
	R2 = Algebraic(nume, d, eps);
  [n m] = size(R1);
  fprintf(fid_out, '%d\n', n);
	fprintf(fid_out, '%f\n', R1);
	fprintf(fid_out, '\n');
	fprintf(fid_out,'%f\n', R2);
	fprintf(fid_out, '\n');
  % deschid pentru citire fisierul primit de functie ca argument
  fid = fopen(nume, 'rt');
  % citesc numarul de pagini web
  N = fscanf(fid, '%d', 1);
  % organizez informatiile din fisier intr-o matrice
  data = dlmread(fid);
  % extrag din matrice val1 si val2
  val1 = data([N+2],[1]);
  val2 = data([N+3],[1]);
  % sortez descrescator valorile vectorului R2
  % https://www.mathworks.com/help/matlab/ref/sort.html
	[x I]=sort(R2,'descend');
	for i = 1:n
		fprintf(fid_out, '%d %d %f\n', i, I(i), Apartenenta(x(i), val1, val2));
	end
  % inchid fisierele deschise
  fclose(fid_out);
  fclose(fid);
end  