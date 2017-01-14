function L = generate_layers(shape)
  L{1} = [ones(shape(1) + 1 + shape(2),1)];
  for i = 2:size(shape,2);
    L{i} = [ones(shape(i), 1)];
  end;
end;
