function Y = read_from_file(file_route)
  [X1, X2, X3, X4, X5, X6, X7] = textread(file_route, '%s%f%f%f%f%f%f', 'delimiter', ',', 'HeaderLines',1);
  Y = [X2];
end;
