function [W, e] = elman_backward(L, W, S, I, lrate=0.1)
  % L = layers
  % W = weights
  % S = shapes
  % I = input
  % e = error
  e = I - L{end};
  delta = e .* dsigmoid(L{end});

  deltas = {};
  deltas{2} = delta;
  for i = size(S,2)-2:1;
     deltas{1} = (deltas{2} * W{i})' * dsigmoid(L{i});
  end;

  for i = size(W)+1:2;
    dw = L{i} * deltas{i};
    W{i} += lrate * dw;
    dw_g{i} = dw;
  end;
end;
