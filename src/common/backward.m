function [W, dw_g, e] = backward(L, W, S, dw_g, I, lrate=0.05, momentum=0.1)
  % L = layers
  % W = weights
  % S = shapes
  % I = input
  % e = error

  e = I - L{end};
  delta = e .* dsigmoid(L{end});
  deltas = {};
  deltas{size(S,2)-1} = delta;
  for i = size(S,2)-2:-1:1;
    deltas{i} = (deltas{size(S,2)-1} * W{i})' * dsigmoid(L{i});
  end;
  for i = 1:size(W,2);
    dw = L{i} * deltas{i}';
    W{i} += lrate * dw + momentum * dw_g{i};
    dw_g{i} = dw;
  end;
end;
