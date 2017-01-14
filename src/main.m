function main()
  file_route = './../dataset/iberdrola.csv';
  impact_range = 20;
  shape = [1,8,1];
  layers = generate_layers(shape);
  weights = generate_weights(shape);


  Y = read_from_file(file_route);
  count = 0;
  for i = 1:(size(Y)-(impact_range + 1));
    M = Y(i:i+impact_range);

    norma = norm(M);

    vecN = M ./ norma;

    [layers, weights, shape, O] = elman_learning(layers, weights, shape, vecN);

    vecD = vecN .* norma;

    if (abs(O * norma - M(size(M,1))) < 0.05);
      count += 1;
    end;


  endfor;

  result = count / (size(Y,1)-(impact_range + 1))

end;


clear all;
main();
