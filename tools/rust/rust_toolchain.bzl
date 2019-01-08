# Manage our rust toolchain specifically
load("@io_bazel_rules_rust//rust:repositories.bzl", "RUST_LINUX_BUILD_FILE")


TOOLCHAINS = """
load("@io_bazel_rules_rust//rust:toolchain.bzl", "rust_toolchain")
toolchain(
    name = "rust-linux-x86_64",
    exec_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
    ],
    toolchain = ":rust-linux-x86_64_impl",
    toolchain_type = "@io_bazel_rules_rust//rust:toolchain",
)

rust_toolchain(
    name = "rust-linux-x86_64_impl",
    os = "linux",
    dylib_ext = ".so",
    staticlib_ext = ".a",
    rust_doc = "@rust_linux_x86_64//:rustdoc",
    rust_lib = ["@rust_linux_x86_64//:rust_lib"],
    rustc = "@rust_linux_x86_64//:rustc",
    rustc_lib = ["@rust_linux_x86_64//:rustc_lib"],
    visibility = ["//visibility:public"],
)
"""


def rust_toolchain_repositories():

  native.new_http_archive(
      name = "rust_linux_x86_64",
      url = "https://static.rust-lang.org/dist/rust-1.31.0-x86_64-unknown-linux-gnu.tar.gz",
      strip_prefix = "rust-1.31.0-x86_64-unknown-linux-gnu",
      sha256 = "c8a2016109ffdc12a488660edc5f30c1643729efc15abe311ebb187437e506bf",
      build_file_content = RUST_LINUX_BUILD_FILE,
  )

  native.new_local_repository(
      name = "rust_default_toolchains",
      path = ".",
      build_file_content = TOOLCHAINS)

  native.register_toolchains(
      "@rust_default_toolchains//:rust-linux-x86_64",
  )
