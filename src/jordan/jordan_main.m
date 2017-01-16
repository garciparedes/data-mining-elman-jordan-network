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
    M = File(i:i+impact_range,:);

    vecN = normalize(M, max(M), min(M));

    [layers, O] = jordan_forward(layers, weights, shape, vecN(1:(end-1)));

    vecD = denormalize(O, max(M), min(M));

    if (abs(vecD(1) - M(size(M,1),1)) < 0.05);
      count += 1;
    end;
    results_jordan(it) = count / it;
  end;
  result_jordan = count / it
end;

clear all;
main();
