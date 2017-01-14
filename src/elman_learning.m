function [L, W, S, O] = elman_learning(L, W, S, I);
  % L = layers
  % W = weights
  % S = shapes
  % I = input[]
  for n = 1:100;
    i = mod(n,size(I,1)-1)+1;
    [L, O] = elman_forward(L, W, S, I(i));
    [W, e] = elman_backward(L, W, S, I(i+1));
  end;
  [L, O] = elman_forward(L, W, S, I(20));
end;
