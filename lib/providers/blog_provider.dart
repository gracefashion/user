import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
class BlogProvider extends ChangeNotifier{

  Future<dynamic>? BlogPosts;
  // Future<dynamic> famousBlogPosts;
  // Future<dynamic> drawingBlogPosts;
  // Future<dynamic> historyBlogPosts;
  // Future<dynamic> otherBlogPosts;
  Future<dynamic>? newclassBlogPosts;
  Future<void> fetchWpPostsForBlog() async {
    print("fetchWpPostsForColors");
    final response = await http.get(Uri.parse(
      "https://a1onlinelearning.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100&categories=4&orderby=date&status=publish",
      // headers: {"Accept: application/json"}
    ));
    BlogPosts = Future.delayed(Duration.zero,(){
      return jsonDecode(response.body);
    });
    notifyListeners();
  }


  // Future<void> fetchWpPostsForFamous() async {
  //   final response = await http.get(Uri.parse(
  //     "https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100&categories=292&orderby=date&status=publish",
  //     // headers: {"Accept: application/json"}
  //   ));
  //   famousBlogPosts = Future.delayed(Duration.zero,(){
  //     return jsonDecode(response.body);
  //   });
  //   notifyListeners();
  // }
  //
  //
  // Future<void> fetchWpPostsForDrawing() async {
  //   final response = await http.get(Uri.parse(
  //     "https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100&categories=293&orderby=date&status=publish",
  //     // headers: {"Accept: application/json"}
  //   ));
  //   drawingBlogPosts = Future.delayed(Duration.zero,(){
  //     return jsonDecode(response.body);
  //   });
  //   notifyListeners();
  // }
  //
  //
  // Future<void> fetchWpPostsForHistory() async {
  //   final response = await http.get(Uri.parse(
  //     "https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100&categories=294&orderby=date&status=publish",
  //     // headers: {"Accept: application/json"}
  //   ));
  //
  //   historyBlogPosts = Future.delayed(Duration.zero,(){
  //     return jsonDecode(response.body);
  //   });
  //   notifyListeners();
  // }
  //
  //
  // Future<void> fetchWpPostsForOther() async {
  //   final response = await http.get(Uri.parse(
  //     "https://hisandhermyanmar-95b62f.ingress-erytho.easywp.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100&categories=1&orderby=date&status=publish",
  //     // headers: {"Accept: application/json"}
  //   ));
  //
  //   otherBlogPosts = Future.delayed(Duration.zero,(){
  //     return jsonDecode(response.body);
  //   });
  //   notifyListeners();
  // }


  Future fetchWpPostsForNewClass() async {
    final response = await http.get(Uri.parse(
      "https://a1onlinelearning.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100&categories=2&orderby=date&status=publish",
      // headers: {"Accept: application/json"}
    ));

    newclassBlogPosts = Future.delayed(Duration.zero,(){
      return jsonDecode(response.body);
    });
    notifyListeners();
  }
}