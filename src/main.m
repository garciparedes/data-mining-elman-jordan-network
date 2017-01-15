function main()
  clear all;
  addpath(genpath(pwd));

  file_route = './../dataset/iberdrola.csv';

  impact_range = 20;
  hold_out_rate = 2/3;
  shape = [1, 10, 1];

  File = read_from_file(file_route);
  norma = norm(File);
  [L, T] = generate_hold_out(size(File)-(impact_range + 1), hold_out_rate);

  results_elman = elman_main(impact_range, shape, File, norma, L, T);
  results_jordan = jordan_main(impact_range, shape, File, norma, L, T);

  %Plot results
  %plot([1:size(T,2)], results_elman, 'color','r'); hold on;
  %plot([1:size(T,2)], results_jordan, 'color', 'b');
end;

main();
