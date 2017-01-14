function W = generate_weights(shape)
  W{1} = random_weights(shape(1) + shape(2) +1, shape(2));
  for i = 2:size(shape,2)-1;
    W{i} = random_weights(shape(i), shape(i+1));
  end;
end;
