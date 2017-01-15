function [L, T] = generate_hold_out(A, frac = 2/3);
  % A = index set
  % frac = fraction of division
  % L = learning index set
  % T = test index set

  L = A;
  T = A;
end;
