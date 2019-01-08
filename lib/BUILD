load("@io_bazel_rules_rust//rust:rust.bzl", "rust_binary", "rust_library", "rust_test")

rust_library(
    name = "proc",
    srcs = [
        "src/lib.rs",
    ],
    deps = [
        "//third_party/rust:quote",
        "//third_party/rust:syn",
        "//third_party/rust:proc_macro2",
    ],
    visibility = ["//visibility:public"],
)

rust_test(
    name = "test_proc",
    srcs = [
        "tests/test_proc.rs",
    ],
    crate_root = "tests/test_proc.rs",
    deps = [
        "//third_party/rust:quote",
        "//third_party/rust:syn",
        ":proc"
    ]
)
