function [L, W, S, dw_g] = jordan_learning(L, W, S, dw_g, I);
  % L = layers, W = weights, S = shapes, I = input[]

  [L, O] = jordan_forward(L, W, S, I(1:(end-1)));
  [W, dw_g, e] = backward(L, W, S, dw_g, I(end));
end;
