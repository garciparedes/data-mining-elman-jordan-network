function y = dsigmoid(x)
  y = e .^ x ./ (1 .+ e .^ x) .^2;
end;
