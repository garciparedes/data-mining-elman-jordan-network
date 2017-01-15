function results_jordan = jordan_main(impact_range, shape, File, norma, L, T);
  layers = jordan_generate_layers(shape);
  weights = jordan_generate_weights(shape);

  for i = 1:(size(weights,2));
    dw_g{i} = zeros(size(weights{i},1), size(weights{i},2));
  end;
  for i = L;
    M = File(i:i+impact_range);
    vecN = M ./ norma;
    [layers, weights, shape, dw_g] = jordan_learning(layers, weights, shape, dw_g, vecN);
  end;

  count = 0;
  it = 0;
  results_jordan = zeros(size(T,2), 1);
  for i = T;
    it += 1;
    M = File(i:i+impact_range);

    vecN = M ./ norma;

    for j = 1:size(vecN,1)-1;
      [layers, O] = jordan_forward(layers, weights, shape, vecN(j));
    end;
    [layers, O] = jordan_forward(layers, weights, shape, vecN(end));

    vecD = O .* norma;

    if (abs(vecD - M(size(M,1))) < 0.05);
      count += 1;
    end;
    results_jordan(it) = count / it;
  end;
  result_jordan = count / it
end;

clear all;
main();
