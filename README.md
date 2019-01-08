# Minimal Test Case Showing Test Failures with Bazel Rust Rules

This is a minimal project that demonstrates how Bazel's Rust Rules
fail to handle tests that depend on the following creates:
 - proc-macro2
 - quote
 - syn
 
 The error is some variation of this:
 ```
 $ cat /home/rob/.cache/bazel/_bazel_rob/72eb038da5e5b7f4c56e935524a9a14b/execroot/__main__/bazel-out/k8-fastbuild/testlogs/lib/test_proc/test.log
exec ${PAGER:-/usr/bin/less} "$0" || exit 1
Executing tests from //lib:test_proc
-----------------------------------------------------------------------------
/home/rob/.cache/bazel/_bazel_rob/72eb038da5e5b7f4c56e935524a9a14b/sandbox/linux-sandbox/2/execroot/__main__/bazel-out/k8-fastbuild/bin/lib/test_proc.runfiles/__main__/lib/test_proc: error while loading shared libraries: libtest-c0479f7cd36f68a3.so: cannot open shared object file: No such file or directory
```

You can verify this by running the tests yourself:
```bash
$ bazel test //lib:test_proc
INFO: Analysed target //lib:test_proc (1 packages loaded, 12 targets configured).
INFO: Found 1 test target...
FAIL: //lib:test_proc (see /home/rob/.cache/bazel/_bazel_rob/72eb038da5e5b7f4c56e935524a9a14b/execroot/__main__/bazel-out/k8-fastbuild/testlogs/lib/test_proc/test.log)
Target //lib:test_proc up-to-date:
  bazel-bin/lib/test_proc
INFO: Elapsed time: 0.136s, Critical Path: 0.05s, Remote (0.00% of the time): [queue: 0.00%, setup: 0.00%, process: 0.00%]
INFO: 1 process: 1 linux-sandbox.
INFO: Build completed, 1 test FAILED, 2 total actions
//lib:test_proc                                                          FAILED in 0.0s
  /home/rob/.cache/bazel/_bazel_rob/72eb038da5e5b7f4c56e935524a9a14b/execroot/__main__/bazel-out/k8-fastbuild/testlogs/lib/test_proc/test.log

INFO: Build completed, 1 test FAILED, 2 total actions

$ cat /home/rob/.cache/bazel/_bazel_rob/72eb038da5e5b7f4c56e935524a9a14b/execroot/__main__/bazel-out/k8-fastbuild/testlogs/lib/test_proc/test.log
exec ${PAGER:-/usr/bin/less} "$0" || exit 1
Executing tests from //lib:test_proc
-----------------------------------------------------------------------------
/home/rob/.cache/bazel/_bazel_rob/72eb038da5e5b7f4c56e935524a9a14b/sandbox/linux-sandbox/1/execroot/__main__/bazel-out/k8-fastbuild/bin/lib/test_proc.runfiles/__main__/lib/test_proc: error while loading shared libraries: libtest-c0479f7cd36f68a3.so: cannot open shared object file: No such file or directory

```

You can see the Cargo versions succeed:
```bash
$ cd lib
$ cargo test
   Compiling proc v0.1.0 (/home/rob/ws/rust-bazel-proc_macro-test/lib)
   Finished dev [unoptimized + debuginfo] target(s) in 0.19s
    Running target/debug/deps/proc-d5dd488e0eb3725e

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out

     Running target/debug/deps/test_proc-36289756094210ee

running 1 test
test test_fail ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out

   Doc-tests proc

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out
```
