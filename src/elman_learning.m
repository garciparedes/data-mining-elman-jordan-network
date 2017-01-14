function [L, W, S, dw_g, O] = elman_learning(L, W, S, dw_g, I);
  % L = layers
  % W = weights
  % S = shapes
  % I = input[]
  for n = 1:100;
    i = mod(n,size(I,1)-1)+1;
    [L, O] = elman_forward(L, W, S, I(i));
    [W, dw_g, e] = elman_backward(L, W, S, dw_g, I(i+1));
  end;
  [L, O] = elman_forward(L, W, S, I(end));
end;
