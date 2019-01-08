"""
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""

def raze_fetch_remote_crates():

    native.new_http_archive(
        name = "raze__proc_macro2__0_4_9",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-0.4.9.crate",
        type = "tar.gz",
        strip_prefix = "proc-macro2-0.4.9",
        build_file = "//third_party/rust/remote:proc-macro2-0.4.9.BUILD"
    )

    native.new_http_archive(
        name = "raze__quote__0_6_4",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-0.6.4.crate",
        type = "tar.gz",
        strip_prefix = "quote-0.6.4",
        build_file = "//third_party/rust/remote:quote-0.6.4.BUILD"
    )

    native.new_http_archive(
        name = "raze__syn__0_15_22",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-0.15.22.crate",
        type = "tar.gz",
        strip_prefix = "syn-0.15.22",
        build_file = "//third_party/rust/remote:syn-0.15.22.BUILD"
    )

    native.new_http_archive(
        name = "raze__unicode_xid__0_1_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.1.0.crate",
        type = "tar.gz",
        strip_prefix = "unicode-xid-0.1.0",
        build_file = "//third_party/rust/remote:unicode-xid-0.1.0.BUILD"
    )

