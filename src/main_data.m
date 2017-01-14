function main_data(file_route)
  Y = read_from_file(file_route);

  for i = 1:(size(Y)-(impact_range + 1));
    M = Y(i:i+impact_range)

    norma = norm(M)
    0.05 / norm(M)



    vecN = M ./ norma
    vecD = vecN .* norma;

  endfor;

end;
