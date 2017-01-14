function main()
  file_route = './../dataset/iberdrola.csv';
  impact_range = 20;
  shape = [1,8,1];
  layers = generate_layers(shape);
  weights = generate_weights(shape);

  D = [
    0.22003,
    0.21696,
    0.21734,
    0.21503,
    0.21965,
    0.21696,
    0.21657,
    0.21657,
    0.21503,
    0.21542,
    0.22003,
    0.22003,
    0.22042,
    0.21849,
    0.21542,
    0.21542,
    0.21465,
    0.22234,
    0.22042,
    0.22119,
    0.22426
  ];

  elman_learning(layers, weights, shape, D)
end;


clear all;
main();
