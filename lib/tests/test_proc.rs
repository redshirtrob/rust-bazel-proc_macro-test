extern crate quote;
extern crate syn;

extern crate proc;

use quote::*;

#[test]
fn test_fail() {
    let ts: syn::Type = proc::fail();
    let expanded = quote! { #ts };
    assert_eq!(expanded.to_string(), "u16");
}
