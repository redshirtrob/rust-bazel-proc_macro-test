git_repository(
    name = "io_bazel_rules_rust",
    commit = "f4b5743d7c9bcba2a6c3fd550660475bfa1f7e79",
    remote = "https://github.com/acmcarther/rules_rust.git",
)

load("//tools/rust:rust_toolchain.bzl", "rust_toolchain_repositories")

rust_toolchain_repositories()

load("//third_party/rust:crates.bzl", "raze_fetch_remote_crates")

raze_fetch_remote_crates()
