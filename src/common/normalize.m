function y = normalize(x, max, min);
  y = (x .- min) ./ (max - min);
end;
