function [L, O] = jordan_forward(L, W, S, I)
  % L = layers
  % W = weights
  % S = shapes
  % I = input
  % O = output

  L{1}(1:S(1)) = I;
  L{1}(S(1)+2:size(L{1},1)) = L{size(L,2)};

  for i = 2:size(S, 2);
    L{i} = sigmoid((L{i-1}' * W{i-1})');
  end;

  O = L{size(S,2)};
end;
