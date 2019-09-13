
[bench_n, bench_data] = benchmark();
[acc_n, acc_data] = accuracy();

bench_fig = figBenchmark(bench_n, bench_data);
acc_fig   = figAccuracy(acc_n, acc_data);

print(bench_fig, '-dpdfcrop', 'plot-benchmark.pdf');
print(acc_fig(1), '-dpdfcrop', 'plot-accuracy-top.pdf');
print(acc_fig(2), '-dpdfcrop', 'plot-accuracy-bottom.pdf');
