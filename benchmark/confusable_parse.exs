alias ExConfusables.Data

confusables_string = Data.get()
|> Enum.shuffle()
|> Enum.reduce(
  "",
  fn ({char, _}, acc) ->
    char = String.to_integer(char, 16)
    <<acc::binary, char::utf8>>
  end
)

Benchee.run(
  %{
    "binary operation" => fn -> ExConfusables.skeleton2(confusables_string) end,
    "char list operation" => fn -> ExConfusables.skeleton(confusables_string) end
  },
  warmup: 0.3,
  time: 5,
  memory_time: 5,
  profile_after: :fprof
)

# Operating System: macOS
# CPU Information: Intel(R) Core(TM) i9-9880H CPU @ 2.30GHz
# Number of Available Cores: 16
# Available memory: 32 GB
# Elixir 1.11.2
# Erlang 23.1.3

# Benchmark suite executing with the following configuration:
# warmup: 300 ms
# time: 5 s
# memory time: 5 s
# reduction time: 0 ns
# parallel: 1
# inputs: none specified
# Estimated total run time: 20.60 s

# Benchmarking binary operation...
# Benchmarking char list operation...

# Name                          ips        average  deviation         median         99th %
# char list operation        251.09        3.98 ms     ±6.04%        3.93 ms        5.36 ms
# binary operation           249.42        4.01 ms     ±9.03%        3.90 ms        5.11 ms

# Comparison:
# char list operation        251.09
# binary operation           249.42 - 1.01x slower +0.0267 ms

# Memory usage statistics:

# Name                        average  deviation         median         99th %
# char list operation         0.98 MB     ±0.00%        0.98 MB        0.98 MB
# binary operation            2.31 MB     ±0.00%        2.31 MB        2.31 MB

# Comparison:
# char list operation         0.98 MB
# binary operation            2.31 MB - 2.36x memory usage +1.33 MB

# Profiling char list operation with fprof...
# Warmup...
# Reading trace data...
# ..................................................
# .................................................,
# ..................................................
# .................................................
# End of trace!
# Processing data...
# Creating output...
# Done!

#                                                                    CNT    ACC (ms)    OWN (ms)
# Total                                                           119857     199.183     199.124
# :fprof.apply_start_stop/4                                            0     199.183       0.005
# anonymous fn/1 in :elixir_compiler_1.__FILE__/1                      1     199.177       0.002
# ExConfusables.skeleton/1                                             1     199.175       0.004
# :unicode.characters_to_nfd_binary/1                                  1     167.487       0.001
# :unicode.characters_to_nfd_binary/4                               7919     167.486      15.845
# :unicode_util.nfd/1                                               7880     151.268      21.127
# :unicode_util.gc/1                                                8798      84.051      11.772
# :unicode_util.gc_1/1                                              6636      56.672      12.837
# :unicode_util.decompose/1                                         5359      46.082      10.721
# Enum.reduce/3                                                        1      31.582       0.001
# Enum."-reduce/3-lists^foldl/2-0-"/3                               6312      31.581      12.629
# :unicode_util.cp/1                                                8689      25.345       8.690
# :unicode_util.gc_extend/3                                         6310      24.826      13.306
# anonymous fn/2 in ExConfusables.skeleton/1                        6311      18.947      12.628
# :unicode_util.decompose_1/1                                       5458      18.614      14.166
# :unicode_util.cpl/2                                               1992      16.654       3.986
# :unicode_util.cpl_cont/2                                          2210      14.171       4.421
# :unicode_util.canonical_order/1                                   1230      12.575       1.231
# :unicode_util.canonical_order_1/1                                 3261      11.343       4.840
# :unicode_util.cpl_cont2/2                                         2806      10.070       4.119
# :unicode_util.is_extend/1                                         7379       7.379       7.379
# :unicode_util.canonical_order_2/2                                 1314       7.138       3.223
# :unicode_util.cp_no_bin/1                                         2051       6.991       2.054
# :unicode_util.cpl_1_cont2/1                                       1865       6.618       3.136
# :unicode_util.unicode_table/1                                     6476       6.484       6.480
# ExConfusables.Confusables.parse_char/1                            6311       6.313       6.312
# :unicode_util.gc_extend2/3                                        1056       5.542       3.168
# :unicode_util.cp_no_binl/2                                         590       4.934       1.181
# :unicode_util.gc_h_L/2                                             633       4.624       1.266
# :unicode_util.cpl_1_cont/1                                         562       3.384       0.934
# :unicode_util.cpl_cont3/2                                         1926       2.536       1.927
# :unicode_util.cpl_1_cont3/1                                       1877       2.490       1.877
# :erlang.++/2                                                      2130       2.130       2.130
# :unicode_util.gc_h_lv_lvt/3                                        319       2.065       0.319
# :lists.reverse/1                                                  1672       2.000       1.836
# :unicode_util."-canonical_order_2/2-lc$^0/1-0-"/2                 1314       1.994       1.993
# :unicode_util.gc_h_V/2                                             182       1.304       0.365
# :lists.keysort/2                                                   636       0.636       0.636
# :unicode.prepend_row_to_acc/2                                       40       0.360       0.120
# :lists.reverse/2                                                   162       0.162       0.162
# :unicode.characters_to_binary/1                                     40       0.120       0.080
# :unicode_util.gc_ext_pict/2                                         14       0.101       0.028
# :unicode.characters_to_list/1                                        1       0.099       0.003
# :unicode.characters_to_list/2                                        1       0.096       0.096
# :suspend                                                            60       0.059       0.000
# :unicode_util.gc_ext_pict/3                                         14       0.042       0.028
# :unicode.characters_to_binary/2                                     40       0.040       0.040
# :garbage_collect                                                    13       0.013       0.013
# :unicode.acc_to_binary/1                                             1       0.007       0.003
# :unicode_util.gc_h_T/2                                               1       0.006       0.002
# :fprof."-apply_start_stop/4-after$^1/0-0-"/3                         1       0.001       0.001
# :erlang.list_to_binary/1                                             1       0.001       0.001
# :undefined                                                           0       0.000       0.000

# Profiling binary operation with fprof...
# Warmup...
# Reading trace data...
# ..................................................
# .................................................,
# .............................................
# End of trace!
# Processing data...
# Creating output...
# Done!

#                                                                    CNT    ACC (ms)    OWN (ms)
# Total                                                            89500     145.409     145.367
# :fprof.apply_start_stop/4                                            0     145.409       0.005
# anonymous fn/1 in :elixir_compiler_1.__FILE__/1                      1     145.403       0.001
# ExConfusables.skeleton2/1                                            1     145.402       0.004
# :unicode.characters_to_nfd_binary/1                                  1     139.041       0.001
# :unicode.characters_to_nfd_binary/4                               7919     139.040      15.844
# :unicode_util.nfd/1                                               7880     122.822      21.127
# :unicode_util.gc/1                                                7880      55.599       7.882
# :unicode_util.gc_1/1                                              6636      47.715      12.834
# :unicode_util.decompose/1                                         5359      46.088      10.725
# :unicode_util.gc_extend/3                                         6310      24.093      13.308
# :unicode_util.decompose_1/1                                       5458      18.630      14.173
# :unicode_util.canonical_order/1                                   1230      12.561       1.231
# :unicode_util.canonical_order_1/1                                 3261      11.329       4.835
# :unicode_util.cp/1                                                7771       7.775       7.773
# :unicode_util.is_extend/1                                         7379       7.385       7.382
# :unicode_util.canonical_order_2/2                                 1314       7.134       3.223
# :unicode_util.unicode_table/1                                     6476       6.482       6.479
# ExConfusables.Confusables.parse/1                                    1       6.319       0.001
# ExConfusables.Confusables.parse/2                                 6312       6.318       6.316
# :unicode_util.gc_extend2/3                                        1056       5.516       3.168
# :unicode_util.gc_h_L/2                                             633       3.830       1.266
# :erlang.++/2                                                      2130       2.130       2.130
# :unicode_util.gc_h_lv_lvt/3                                        319       2.025       0.319
# :lists.reverse/1                                                  1671       1.995       1.833
# :unicode_util."-canonical_order_2/2-lc$^0/1-0-"/2                 1314       1.992       1.992
# :unicode_util.gc_h_V/2                                             182       1.061       0.364
# :lists.keysort/2                                                   636       0.638       0.637
# :unicode.prepend_row_to_acc/2                                       40       0.362       0.120
# :lists.reverse/2                                                   161       0.161       0.161
# :unicode.characters_to_binary/1                                     41       0.158       0.082
# :unicode_util.gc_ext_pict/2                                         14       0.086       0.028
# :unicode.characters_to_binary/2                                     41       0.076       0.076
# :unicode_util.gc_ext_pict/3                                         14       0.044       0.028
# :suspend                                                            43       0.042       0.000
# :garbage_collect                                                    12       0.012       0.012
# :unicode.acc_to_binary/1                                             1       0.007       0.003
# :unicode_util.gc_h_T/2                                               1       0.006       0.002
# :fprof."-apply_start_stop/4-after$^1/0-0-"/3                         1       0.001       0.001
# :erlang.list_to_binary/1                                             1       0.001       0.001
# :undefined                                                           0       0.000       0.000
