function W = random_weights(x, y)
  W = [ (2 .* rand(x, y) .- 1) * 0.25 ];
end;
