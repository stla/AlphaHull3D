#include "alphahull3d.h"

// [[Rcpp::export]]
Rcpp::NumericMatrix FAS_cpp(Rcpp::NumericMatrix pts, double alpha) {
  // make list of points
  const int npoints = pts.ncol();
  std::list<Point3> points;
  for(int i = 0; i < npoints; i++) {
    const Rcpp::NumericVector pt_i = pts(Rcpp::_, i);
    points.push_back(Point3(pt_i(0), pt_i(1), pt_i(2)));
  }
  // compute alpha shape
  Fixed_alpha_shape_3 as(points.begin(), points.end(), alpha);
  // get the facets
  std::list<Facet> facets;
  as.get_alpha_shape_facets(std::back_inserter(facets),
                            Fixed_alpha_shape_3::REGULAR);
  as.get_alpha_shape_facets(std::back_inserter(facets),
                            Fixed_alpha_shape_3::SINGULAR);
  const int nfacets = facets.size();
  // output - facet indices are 3i, 3i+1, 3i+2
  Rcpp::NumericMatrix Vertices(3, 3 * nfacets);
  std::list<Facet>::iterator it_facet;
  int i = 0;
  for(it_facet = facets.begin(); it_facet != facets.end(); it_facet++) {
    Facet facet = *it_facet;
    // to have a consistent orientation, always consider an exterior cell
    if(as.classify(facet.first) != Fixed_alpha_shape_3::EXTERIOR) {
      facet = as.mirror_facet(facet);
    }
    int indices[3] = {
      (facet.second + 1) % 4,
      (facet.second + 2) % 4,
      (facet.second + 3) % 4,
    };
    // needed to get a consistent orientation
    if(facet.second % 2 == 0 ){
      std::swap(indices[0], indices[1]);
    }
    const Point3 v1 = facet.first->vertex(indices[0])->point();
    const Point3 v2 = facet.first->vertex(indices[1])->point();
    const Point3 v3 = facet.first->vertex(indices[2])->point();
    const Rcpp::NumericVector V1 = {v1.x(), v1.y(), v1.z()};
    const Rcpp::NumericVector V2 = {v2.x(), v2.y(), v2.z()};
    const Rcpp::NumericVector V3 = {v3.x(), v3.y(), v3.z()};
    Vertices(Rcpp::_, 3*i)   = V1;
    Vertices(Rcpp::_, 3*i+1) = V2;
    Vertices(Rcpp::_, 3*i+2) = V3;
    i++;
  }
  return Vertices;
}