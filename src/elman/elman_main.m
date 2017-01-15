function elman_main(impact_range, shape, File, norma, L, T);
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
  for i = L;
    it += 1;
    M = File(i:i+impact_range);

    vecN = M ./ norma;

    for j = 1:size(vecN,1)-1;
      [layers, O] = elman_forward(layers, weights, shape, vecN(j));
    end;
    [layers, O] = elman_forward(layers, weights, shape, vecN(end));

    vecD = O .* norma;

    if (abs(vecD - M(size(M,1))) < 0.05);
      count += 1;
      result_elman = count / it;
    end;
  end;
  result_elman
end;
