function [W, dw_g, e] = elman_backward(L, W, S, dw_g, I, lrate=0.1, momentum=0.1)
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
    W{i} += lrate * dw + momentum * dw_g{i};
    dw_g{i} = dw;
  end;
end;
