// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include "AlphaHull3D_types.h"
#include <RcppEigen.h>
#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// FAS_cpp
Rcpp::NumericMatrix FAS_cpp(Rcpp::NumericMatrix pts, double alpha, bool volume);
RcppExport SEXP _AlphaHull3D_FAS_cpp(SEXP ptsSEXP, SEXP alphaSEXP, SEXP volumeSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericMatrix >::type pts(ptsSEXP);
    Rcpp::traits::input_parameter< double >::type alpha(alphaSEXP);
    Rcpp::traits::input_parameter< bool >::type volume(volumeSEXP);
    rcpp_result_gen = Rcpp::wrap(FAS_cpp(pts, alpha, volume));
    return rcpp_result_gen;
END_RCPP
}
// AS_cpp
Rcpp::XPtr<Alpha_shape_3> AS_cpp(Rcpp::NumericMatrix pts);
RcppExport SEXP _AlphaHull3D_AS_cpp(SEXP ptsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericMatrix >::type pts(ptsSEXP);
    rcpp_result_gen = Rcpp::wrap(AS_cpp(pts));
    return rcpp_result_gen;
END_RCPP
}
// optimalAS_cpp
Rcpp::NumericMatrix optimalAS_cpp(Rcpp::XPtr<Alpha_shape_3> as_xptr, int nc);
RcppExport SEXP _AlphaHull3D_optimalAS_cpp(SEXP as_xptrSEXP, SEXP ncSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::XPtr<Alpha_shape_3> >::type as_xptr(as_xptrSEXP);
    Rcpp::traits::input_parameter< int >::type nc(ncSEXP);
    rcpp_result_gen = Rcpp::wrap(optimalAS_cpp(as_xptr, nc));
    return rcpp_result_gen;
END_RCPP
}
// solidAS_cpp
Rcpp::NumericMatrix solidAS_cpp(Rcpp::XPtr<Alpha_shape_3> as_xptr);
RcppExport SEXP _AlphaHull3D_solidAS_cpp(SEXP as_xptrSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::XPtr<Alpha_shape_3> >::type as_xptr(as_xptrSEXP);
    rcpp_result_gen = Rcpp::wrap(solidAS_cpp(as_xptr));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_AlphaHull3D_FAS_cpp", (DL_FUNC) &_AlphaHull3D_FAS_cpp, 3},
    {"_AlphaHull3D_AS_cpp", (DL_FUNC) &_AlphaHull3D_AS_cpp, 1},
    {"_AlphaHull3D_optimalAS_cpp", (DL_FUNC) &_AlphaHull3D_optimalAS_cpp, 2},
    {"_AlphaHull3D_solidAS_cpp", (DL_FUNC) &_AlphaHull3D_solidAS_cpp, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_AlphaHull3D(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
