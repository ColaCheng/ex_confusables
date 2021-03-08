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
    "binary operation" => fn -> ExConfusables.skeleton(confusables_string) end,
    "char list operation" => fn -> ExConfusables.skeleton2(confusables_string) end
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
# char list operation        252.59        3.96 ms    ±15.83%        3.73 ms        7.08 ms
# binary operation           233.05        4.29 ms    ±13.62%        4.05 ms        5.93 ms

# Comparison:
# char list operation        252.59
# binary operation           233.05 - 1.08x slower +0.33 ms

# Memory usage statistics:

# Name                   Memory usage
# char list operation         0.94 MB
# binary operation            2.31 MB - 2.46x memory usage +1.37 MB

# **All measurements for memory usage were the same**

# Profiling char list operation with eprof...
# Warmup...


# Profile results of #PID<0.4337.0>
# #                                                 CALLS    % TIME µS/CALL
# Total                                             12061 100. 3108    0.26
# :unicode_util.gc_h_T/2                                1 0.00    0    0.00
# :erlang.apply/2                                       1 0.00    1    1.00
# Enum.reduce/3                                         1 0.00    1    1.00
# anonymous fn/1 in :elixir_compiler_1.__FILE__/1       1 0.00    1    1.00
# :unicode.characters_to_nfd_list/1                     1 0.00    1    1.00
# :unicode.characters_to_list/1                         1 0.00    1    1.00
# ExConfusables.skeleton2/1                             1 0.00    1    1.00
# :unicode_util.gc_ext_pict/3                          16 0.01    4    0.25
# :unicode_util.gc_ext_pict/2                          16 0.01    4    0.25
# :unicode_util.gc_h_lv_lvt/3                         322 0.19   59    0.18
# :unicode_util.gc_h_V/2                              182 0.21   64    0.35
# :lists.keysort/2                                    638 0.35  108    0.17
# :unicode_util.cpl_1_cont/1                          550 0.44  136    0.25
# :unicode_util.gc_h_L/2                              633 0.56  174    0.27
# :unicode_util.canonical_order/1                    1235 0.58  180    0.15
# :unicode_util.cp_no_binl/2                          596 0.59  182    0.31
# :unicode.characters_to_list/2                         1 0.74  230  230.00
# :unicode_util.cpl_1_cont3/1                        1861 0.82  256    0.14
# :lists.reverse/1                                   1640 0.84  261    0.16
# :unicode_util.cpl_cont3/2                          1948 0.86  268    0.14
# :unicode_util."-canonical_order_2/2-lc$^0/1-0-"/2  1316 0.89  276    0.21
# :unicode_util.cp_no_bin/1                          2061 0.98  305    0.15
# :erlang.++/2                                       2134 0.99  309    0.14
# :lists.reverse/2                                   1169 1.07  332    0.28
# :unicode_util.canonical_order_2/2                  1316 1.45  452    0.34
# :unicode_util.cpl_1_cont2/1                        1825 1.46  454    0.25
# :unicode_util.gc_extend2/3                         1060 1.46  455    0.43
# :unicode_util.cpl/2                                1984 1.74  540    0.27
# :unicode_util.cpl_cont2/2                          2812 1.84  573    0.20
# :unicode_util.cpl_cont/2                           2204 2.01  624    0.28
# :unicode_util.canonical_order_1/1                  3270 2.12  659    0.20
# :unicode_util.unicode_table/1                      6474 3.56 1105    0.17
# :unicode_util.cp/1                                 8692 4.03 1254    0.14
# :unicode_util.is_extend/1                          7379 4.19 1302    0.18
# :unicode_util.decompose/1                          5360 4.66 1449    0.27
# ExConfusables.Confusables.parse_char/1             6311 5.22 1621    0.26
# :unicode_util.gc_extend/3                          6303 6.07 1888    0.30
# Enum."-reduce/3-lists^foldl/2-0-"/3                6312 6.12 1902    0.30
# :unicode_util.gc/1                                 8806 6.13 1905    0.22
# anonymous fn/2 in ExConfusables.skeleton2/1        6311 6.20 1928    0.31
# :unicode_util.decompose_1/1                        5470 7.02 2182    0.40
# :unicode_util.gc_1/1                               6635 7.05 2192    0.33
# :unicode.characters_to_nfd_list/2                  7883 7.78 2418    0.31
# :unicode_util.nfd/1                                7883 9.73 3023    0.38

# Profile done over 44 matching functions

# Profiling binary operation with eprof...
# Warmup...


# Profile results of #PID<0.4339.0>
# #                                                 CALLS     % TIME µS/CALL
# Total                                             89491 100.0 2562    0.29
# :unicode.characters_to_nfd_binary/1                   1  0.00    0    0.00
# :unicode_util.gc_h_T/2                                1  0.00    0    0.00
# anonymous fn/1 in :elixir_compiler_1.__FILE__/1       1  0.00    1    1.00
# :unicode.acc_to_binary/1                              1  0.00    1    1.00
# ExConfusables.Confusables.parse/1                     1  0.00    1    1.00
# ExConfusables.skeleton/1                              1  0.00    1    1.00
# :erlang.apply/2                                       1  0.01    2    2.00
# :erlang.list_to_binary/1                              1  0.02    4    4.00
# :unicode_util.gc_ext_pict/2                          16  0.02    4    0.25
# :unicode_util.gc_ext_pict/3                          16  0.03    8    0.50
# :unicode.characters_to_binary/1                      41  0.05   12    0.29
# :unicode.prepend_row_to_acc/2                        40  0.07   18    0.45
# :unicode_util.gc_h_V/2                              182  0.25   63    0.35
# :lists.reverse/2                                    152  0.30   77    0.51
# :unicode_util.gc_h_lv_lvt/3                         322  0.30   78    0.24
# :lists.keysort/2                                    638  0.45  115    0.18
# :unicode_util.gc_h_L/2                              633  0.76  195    0.31
# :unicode.characters_to_binary/2                      41  0.90  231    5.63
# :unicode_util.canonical_order/1                    1235  0.92  235    0.19
# :unicode_util."-canonical_order_2/2-lc$^0/1-0-"/2  1316  1.13  289    0.22
# :lists.reverse/1                                   1679  1.22  313    0.19
# :erlang.++/2                                       2135  1.51  386    0.18
# :unicode_util.gc_extend2/3                         1060  1.84  471    0.44
# :unicode_util.canonical_order_2/2                  1316  1.88  482    0.37
# :unicode_util.canonical_order_1/1                  3270  2.70  691    0.21
# :unicode_util.unicode_table/1                      6474  4.80 1229    0.19
# :unicode_util.is_extend/1                          7379  5.26 1348    0.18
# :unicode_util.decompose/1                          5360  6.03 1545    0.29
# :unicode_util.cp/1                                 7768  6.43 1648    0.21
# :unicode_util.gc/1                                 7883  7.14 1830    0.23
# :unicode_util.gc_extend/3                          6304  7.71 1976    0.31
# ExConfusables.Confusables.parse/2                  6312  8.12 2082    0.33
# :unicode_util.decompose_1/1                        5470  8.60 2205    0.40
# :unicode_util.gc_1/1                               6636  9.75 2499    0.38
# :unicode.characters_to_nfd_binary/4                7922  9.81 2513    0.32
# :unicode_util.nfd/1                                7883 11.99 3073    0.39

# Profile done over 36 matching functions
