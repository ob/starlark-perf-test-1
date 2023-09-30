# Perf analysis of Bazel's Starlark for concatenating lists

```shell
starlark-test ❯ bazel build --profile=append.gz :append_rule
INFO: Analyzed target //:append_rule (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //:append_rule up-to-date:
  bazel-bin/append_rule.txt
INFO: Elapsed time: 0.100s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
```

```shell
starlark-test ❯ bazel build --profile=append.gz :append_rule
INFO: Analyzed target //:append_rule (4 packages loaded, 7 targets configured).
INFO: Found 1 target...
Target //:append_rule up-to-date:
  bazel-bin/append_rule.txt
INFO: Elapsed time: 8.549s, Critical Path: 0.32s
INFO: 2 processes: 2 internal.
INFO: Build completed successfully, 2 total actions
```

```shell
starlark-test ❯ bazel analyze-profile append.gz
WARNING: This information is intended for consumption by Bazel developers only, and may change at any time. Script against it at your own risk
INFO: Profile created on 2023-09-30T02:25:20.261137Z, build ID: cea9a7b7-d723-42bb-b912-4aadd6e284f1, output base: /private/var/tmp/_bazel_ob/4ff1d933dcc26d13313d98939d693d09

=== PHASE SUMMARY INFORMATION ===

Total launch phase time                              0.055 s    0.64%
Total init phase time                                0.081 s    0.95%
Total target pattern evaluation phase time           0.005 s    0.06%
Total interleaved loading-and-analysis phase time    7.734 s   90.46%
Total preparation phase time                         0.001 s    0.01%
Total execution phase time                           0.671 s    7.86%
Total finish phase time                              0.000 s    0.01%
---------------------------------------------------------------------
Total run time                                       8.549 s  100.00%

Critical path (322 ms):
       Time Percentage   Description
     322 ms  100.00%   action 'Writing file append_rule.txt'
```

```shell
starlark-test ❯ bazel analyze-profile plus_equal_rule.gz
WARNING: This information is intended for consumption by Bazel developers only, and may change at any time. Script against it at your own risk
INFO: Profile created on 2023-09-30T02:25:43.408675Z, build ID: 478b6ba1-413f-4afd-9913-4587683d72c9, output base: /private/var/tmp/_bazel_ob/4ff1d933dcc26d13313d98939d693d09

=== PHASE SUMMARY INFORMATION ===

Total launch phase time                              0.057 s    0.74%
Total init phase time                                0.010 s    0.14%
Total target pattern evaluation phase time           0.001 s    0.01%
Total interleaved loading-and-analysis phase time    7.008 s   90.56%
Total preparation phase time                         0.001 s    0.01%
Total execution phase time                           0.660 s    8.53%
Total finish phase time                              0.000 s    0.01%
---------------------------------------------------------------------
Total run time                                       7.739 s  100.00%

Critical path (313 ms):
       Time Percentage   Description
     313 ms  100.00%   action 'Writing file plus_equal_rule.txt'
```
