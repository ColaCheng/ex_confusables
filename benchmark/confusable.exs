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
    "skeleton" => fn -> ExConfusables.skeleton(confusables_string) end
  },
  warmup: 0.3,
  time: 5,
  memory_time: 5,
  profile_after: :fprof
)

# Operating System: macOS
# CPU Information: Intel(R) Core(TM) i7-8569U CPU @ 2.80GHz
# Number of Available Cores: 8
# Available memory: 16 GB
# Elixir 1.11.2
# Erlang 23.0.4

# Benchmark suite executing with the following configuration:
# warmup: 300 ms
# time: 5 s
# memory time: 5 s
# reduction time: 0 ns
# parallel: 1
# inputs: none specified
# Estimated total run time: 10.30 s

# Benchmarking skeleton...

# Name               ips        average  deviation         median         99th %
# skeleton        378.93        2.64 ms    ±11.50%        2.59 ms        3.64 ms

# Memory usage statistics:

# Name        Memory usage
# skeleton       957.66 KB

# **All measurements for memory usage were the same**

# Profiling skeleton with fprof...
# Warmup...
# Reading trace data...
# ..................................................
# .................................................,
# ..................................................
# ..........................................
# End of trace!
# Processing data...
# Creating output...
# Done!

#                                                                    CNT    ACC (ms)    OWN (ms)
# Total                                                           113525     193.148     193.083
# :fprof.apply_start_stop/4                                            0     193.148       0.008
# anonymous fn/1 in :elixir_compiler_1.__FILE__/1                      1     193.139       0.001
# ExConfusables.skeleton/1                                             1     193.138       0.005
# :unicode.characters_to_nfd_binary/1                                  1     167.814       0.001
# :unicode.characters_to_nfd_binary/4                               7915     167.813      15.866
# :unicode_util.nfd/1                                               7876     151.565      21.152
# :unicode_util.gc/1                                                8801      84.369      11.820
# :unicode_util.gc_1/1                                              6639      56.794      12.889
# :unicode_util.decompose/1                                         5356      46.031      10.726
# :unicode_util.cp/1                                                8703      25.417       8.709
# ExConfusables."-skeleton/1-lc$^0/1-0-"/1                          6312      25.275      18.943
# :unicode_util.gc_extend/3                                         6315      24.877      13.328
# :unicode_util.decompose_1/1                                       5426      18.593      14.143
# :unicode_util.cpl/2                                               1996      16.707       4.003
# :unicode_util.cpl_cont/2                                          2188      14.099       4.386
# :unicode_util.canonical_order/1                                   1217      12.532       1.223
# :unicode_util.canonical_order_1/1                                 3235      11.309       4.825
# :unicode_util.cpl_cont2/2                                         2794      10.085       4.141
# :unicode_util.is_extend/1                                         7382       7.392       7.387
# :unicode_util.canonical_order_2/2                                 1308       7.123       3.217
# :unicode_util.cp_no_bin/1                                         2057       7.050       2.064
# :unicode_util.cpl_1_cont2/1                                       1860       6.621       3.121
# :unicode_util.unicode_table/1                                     6477       6.483       6.480
# ExConfusables.Confusables.prototype/1                             6311       6.324       6.318
# :unicode_util.gc_extend2/3                                        1053       5.571       3.173
# :unicode_util.cp_no_binl/2                                         595       4.984       1.196
# :unicode_util.gc_h_L/2                                             633       4.457       1.273
# :unicode_util.cpl_1_cont/1                                         575       3.439       0.981
# :unicode_util.cpl_cont3/2                                         1949       2.598       1.961
# :unicode_util.cpl_1_cont3/1                                       1883       2.500       1.887
# :erlang.++/2                                                      2121       2.131       2.126
# :unicode_util.gc_h_lv_lvt/3                                        316       2.042       0.317
# :lists.reverse/1                                                  1652       1.995       1.822
# :unicode_util."-canonical_order_2/2-lc$^0/1-0-"/2                 1308       1.991       1.991
# :unicode_util.gc_h_V/2                                             182       1.351       0.364
# :lists.keysort/2                                                   630       0.630       0.630
# :unicode.prepend_row_to_acc/2                                       40       0.364       0.120
# :lists.reverse/2                                                   168       0.172       0.170
# :unicode.characters_to_binary/1                                     41       0.164       0.083
# :unicode_util.gc_ext_pict/2                                         15       0.127       0.030
# :garbage_collect                                                    76       0.084       0.084
# :unicode.characters_to_binary/2                                     41       0.081       0.081
# :suspend                                                            57       0.065       0.000
# :unicode_util.gc_ext_pict/3                                         15       0.050       0.031
# :unicode.acc_to_binary/1                                             1       0.007       0.003
# :unicode_util.gc_h_T/2                                               1       0.006       0.002
# :fprof."-apply_start_stop/4-after$^1/0-0-"/3                         1       0.001       0.001
# :erlang.list_to_binary/1                                             1       0.001       0.001
# :undefined                                                           0       0.000       0.000
