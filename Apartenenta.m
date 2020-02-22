% Mirciu Andrei-Constantin 313CD

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  
  % tratez toate cele 3 cazuri ale functiei u(x)
	if x >= 0 && x < val1
		y = 0;
  end  
  % functia u(x) este continua pe tot domeniul de difinitie, cu exceptia punctelor val1 si val2
	if x >= val1 && x <= val2
		a = 1/(val2 - val1);
		b = -a * val1;
		y = a * x + b;
  end  
	if x > val2 && x < 1
		y = 1;
	end
end