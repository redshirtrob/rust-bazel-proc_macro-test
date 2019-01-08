extern crate syn;
extern crate quote;
extern crate proc_macro2;

#[allow(dead_code)]
pub fn fail() -> syn::Type {
    let ty: syn::Type = syn::parse_str("u16").unwrap();
    ty
}
