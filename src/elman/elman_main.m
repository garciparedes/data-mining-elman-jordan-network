function results_elman = elman_main(impact_range, shape, File, norma, L, T);
  layers = elman_generate_layers(shape);
  weights = elman_generate_weights(shape);

  for i = 1:(size(weights,2));
    dw_g{i} = zeros(size(weights{i},1), size(weights{i},2));
  end;

  for i = L;
    M = File(i:i+impact_range);
    vecN = M ./ norma;
    [layers, weights, shape, dw_g] = elman_learning(layers, weights, shape, dw_g, vecN);
  end;

  count = 0;
  it = 0;
  results_elman = zeros(size(T,2), 1);
  for i = T;
    it += 1;
    M = File(i:i+impact_range);

    vecN = normalize(M, max(M), min(M));

    for j = 1:size(vecN,1)-1;
          [layers, O] = elman_forward(layers, weights, shape, vecN(j));
    end;
    [layers, O] = elman_forward(layers, weights, shape, vecN(end));

    vecD = denormalize(O, max(M), min(M));

    if (abs(vecD - M(size(M,1))) < 0.05);
      count += 1;
    end;
    results_elman(it) = count / it;
  end;
  result_elman = count / it
end;
