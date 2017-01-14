function main()
  file_route = './../dataset/iberdrola.csv';
  impact_range = 20
  shape = [1,8,1]
  layers = generate_layers(shape)
  weights = generate_weights(shape)


end;


clear all;
main();
