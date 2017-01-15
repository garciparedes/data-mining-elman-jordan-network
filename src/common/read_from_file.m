function Y = read_from_file(file_route)
  [X, Y] = textread(file_route, '%s%f', 'delimiter', ',', 'HeaderLines',1);
end;
