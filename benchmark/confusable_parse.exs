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
  profile_after: true
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
# char list operation        262.23        3.81 ms     ±4.91%        3.76 ms        4.61 ms
# binary operation           247.49        4.04 ms    ±11.87%        3.82 ms        5.35 ms

# Comparison:
# char list operation        262.23
# binary operation           247.49 - 1.06x slower +0.23 ms

# Memory usage statistics:

# Name                   Memory usage
# char list operation         0.97 MB
# binary operation            2.32 MB - 2.40x memory usage +1.35 MB

# **All measurements for memory usage were the same**

# Profiling char list operation with eprof...
# Warmup...


# Profile results of #PID<0.4303.0>
# #                                                 CALLS    % TIME µS/CALL
# Total                                             11958 100. 3130    0.26
# :unicode_util.gc_h_T/2                                1 0.00    0    0.00
# Enum.reduce/3                                         1 0.00    1    1.00
# anonymous fn/1 in :elixir_compiler_1.__FILE__/1       1 0.00    1    1.00
# :unicode.characters_to_nfd_binary/1                   1 0.00    1    1.00
# ExConfusables.skeleton/1                              1 0.00    1    1.00
# :unicode.acc_to_binary/1                              1 0.01    2    2.00
# :unicode.characters_to_list/1                         1 0.01    2    2.00
# :erlang.list_to_binary/1                              1 0.01    3    3.00
# :unicode.characters_to_binary/1                      40 0.01    4    0.10
# :unicode_util.gc_ext_pict/2                          15 0.01    4    0.27
# :erlang.apply/2                                       1 0.06   19   19.00
# :unicode_util.gc_ext_pict/3                          15 0.06   20    1.33
# :unicode.prepend_row_to_acc/2                        40 0.07   21    0.53
# :unicode_util.gc_h_V/2                              182 0.19   60    0.33
# :unicode_util.gc_h_lv_lvt/3                         311 0.23   72    0.23
# :lists.keysort/2                                    635 0.29   91    0.14
# :unicode_util.cpl_1_cont/1                          491 0.40  124    0.25
# :unicode_util.cp_no_binl/2                          598 0.55  171    0.29
# :unicode.characters_to_binary/2                      40 0.60  187    4.67
# :unicode_util.canonical_order/1                    1216 0.62  193    0.16
# :unicode_util.gc_h_L/2                              633 0.65  202    0.32
# :lists.reverse/2                                    164 0.72  225    1.37
# :unicode_util.cpl_1_cont3/1                        1864 0.85  265    0.14
# :unicode.characters_to_list/2                         1 0.85  267  267.00
# :unicode_util."-canonical_order_2/2-lc$^0/1-0-"/2  1313 0.89  280    0.21
# :unicode_util.cpl_cont3/2                          1904 0.95  298    0.16
# :lists.reverse/1                                   1662 0.97  305    0.18
# :unicode_util.cp_no_bin/1                          2057 1.00  313    0.15
# :erlang.++/2                                       2130 1.02  319    0.15
# :unicode_util.canonical_order_2/2                  1313 1.39  435    0.33
# :unicode_util.cpl_1_cont2/1                        1809 1.41  441    0.24
# :unicode_util.gc_extend2/3                         1049 1.45  455    0.43
# :unicode_util.cpl/2                                1951 1.71  535    0.27
# :unicode_util.cpl_cont2/2                          2838 1.84  575    0.20
# :unicode_util.cpl_cont/2                           2262 2.00  626    0.28
# :unicode_util.canonical_order_1/1                  3249 2.19  685    0.21
# :unicode_util.unicode_table/1                      6475 3.68 1153    0.18
# :unicode_util.is_extend/1                          7386 3.81 1193    0.16
# :unicode_util.cp/1                                 8689 4.63 1449    0.17
# :unicode_util.decompose/1                          5349 4.74 1485    0.28
# ExConfusables.Confusables.parse_char/1             6311 5.25 1645    0.26
# :unicode_util.gc/1                                 8774 5.82 1821    0.21
# Enum."-reduce/3-lists^foldl/2-0-"/3                6312 6.03 1887    0.30
# :unicode_util.gc_extend/3                          6322 6.15 1924    0.30
# anonymous fn/2 in ExConfusables.skeleton/1         6311 6.16 1929    0.31
# :unicode_util.decompose_1/1                        5445 6.48 2029    0.37
# :unicode_util.gc_1/1                               6642 7.22 2261    0.34
# :unicode.characters_to_nfd_binary/4                7910 7.89 2471    0.31
# :unicode_util.nfd/1                                7871 9.13 2859    0.36

# Profile done over 49 matching functions

# Profiling binary operation with eprof...
# Warmup...


# Profile results of #PID<0.4305.0>
# #                                                 CALLS     % TIME µS/CALL
# Total                                             89387 100.0 2522    0.28
# :unicode.acc_to_binary/1                              1  0.00    0    0.00
# :unicode.characters_to_nfd_binary/1                   1  0.00    0    0.00
# :unicode_util.gc_h_T/2                                1  0.00    0    0.00
# anonymous fn/1 in :elixir_compiler_1.__FILE__/1       1  0.00    1    1.00
# ExConfusables.skeleton2/1                             1  0.00    1    1.00
# :erlang.apply/2                                       1  0.01    2    2.00
# ExConfusables.Confusables.parse/1                     1  0.01    2    2.00
# :erlang.list_to_binary/1                              1  0.01    3    3.00
# :unicode_util.gc_ext_pict/2                          15  0.02    5    0.33
# :unicode_util.gc_ext_pict/3                          15  0.03    7    0.47
# :unicode.characters_to_binary/1                      41  0.04   10    0.24
# :unicode.prepend_row_to_acc/2                        40  0.08   20    0.50
# :unicode_util.gc_h_lv_lvt/3                         311  0.22   55    0.18
# :unicode_util.gc_h_V/2                              182  0.28   70    0.38
# :lists.reverse/2                                    163  0.38   95    0.58
# :lists.keysort/2                                    635  0.40  101    0.16
# :unicode_util.gc_h_L/2                              633  0.78  197    0.31
# :unicode_util.canonical_order/1                    1216  0.80  202    0.17
# :unicode.characters_to_binary/2                      41  0.95  239    5.83
# :unicode_util."-canonical_order_2/2-lc$^0/1-0-"/2  1313  1.20  303    0.23
# :lists.reverse/1                                   1661  1.21  305    0.18
# :erlang.++/2                                       2130  1.45  367    0.17
# :unicode_util.gc_extend2/3                         1049  1.88  474    0.45
# :unicode_util.canonical_order_2/2                  1313  1.93  487    0.37
# :unicode_util.canonical_order_1/1                  3249  2.93  740    0.23
# :unicode_util.unicode_table/1                      6475  5.01 1265    0.20
# :unicode_util.is_extend/1                          7386  5.15 1300    0.18
# :unicode_util.decompose/1                          5349  5.74 1447    0.27
# :unicode_util.cp/1                                 7787  6.64 1674    0.21
# :unicode_util.gc/1                                 7871  7.33 1849    0.23
# :unicode_util.gc_extend/3                          6323  7.57 1910    0.30
# ExConfusables.Confusables.parse/2                  6312  8.31 2096    0.33
# :unicode_util.decompose_1/1                        5445  8.34 2103    0.39
# :unicode_util.gc_1/1                               6643  9.35 2360    0.36
# :unicode.characters_to_nfd_binary/4                7910 10.18 2567    0.32
# :unicode_util.nfd/1                                7871 11.78 2971    0.38

# Profile done over 36 matching functions
