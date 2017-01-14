function main()
  fileroute = './../dataset/iberdrola.csv';
  impact_range = 20
  shape = [1,8,1]
  layers = generate_layers(shape)
  weights = generate_weights(shape)

  %data = csvread(fileroute);


  [X, Y] = textread(fileroute, '%s%f', 'delimiter', ',', 'HeaderLines',1);

  %{
  for i = 1:(size(Y)-(impact_range + 1));
    M = Y(i:i+impact_range)

    norma = norm(M)
    0.05 / norm(M)



    vecN = M ./ norma
    vecD = vecN .* norma;

  endfor;
  }%
end;


clear all;
main();
