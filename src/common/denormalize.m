function y = denormalize(x, max, min);
  y = x .* (max - min) .+ min;
end;
