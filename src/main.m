function main()
  file_route = './../dataset/iberdrola.csv';
  impact_range = 20;
  shape = [1, 32, 64, 32, 1];
  layers = generate_layers(shape);
  weights = generate_weights(shape);

  Y = read_from_file(file_route);
  count = 0;
  norma = norm(Y);

  for i = 1:(size(weights,2));
    dw_g{i} = zeros(size(weights{i},1), size(weights{i},2));
  end;

  [L, T] = generate_hold_out([1:(size(Y)-(impact_range + 1))], 2/3);

  for i = L;
    M = Y(i:i+impact_range);

    vecN = M ./ norma;

    [layers, weights, shape, dw_g, O] = elman_learning(layers, weights, shape, dw_g, vecN);
    vecD = O .* norma;

    if (abs(vecD - M(size(M,1))) < 0.05);
      count += 1;
    end;
  end;

  result = count / (size(Y,1)-(impact_range + 1))
end;


clear all;
main();
