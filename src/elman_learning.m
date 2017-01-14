function elman_learning(L, W, S, I);
  % L = layers
  % W = weights
  % S = shapes
  % I = input[]

  for i = 1:size(I,1)-1;
    [L, O] = elman_forward(L, W, S, I(i));
    [W, e] = elman_backward(L, W, S, I(i+1));
  end;
end;
