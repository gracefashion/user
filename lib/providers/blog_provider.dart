import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
class BlogProvider extends ChangeNotifier{

  Future<dynamic>? BlogPosts;
  Future<dynamic>? newclassBlogPosts;

  Future fetchWpPostsForBlog() async {
    final response = await http.get(Uri.parse(
      "https://gracefashionanddesignschool.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100&categories=56&orderby=date&status=publish",
      // headers: {"Accept: application/json"}
    ));
    BlogPosts = Future.delayed(Duration.zero,(){
      return jsonDecode(response.body);
    });
    notifyListeners();
  }

  Future fetchWpPostsForNewClass() async {
    final response = await http.get(Uri.parse(
      "https://gracefashionanddesignschool.com/index.php/wp-json/wp/v2/posts?_embed&per_page=100&categories=57&orderby=date&status=publish",
      // headers: {"Accept: application/json"}
    ));

    newclassBlogPosts = Future.delayed(Duration.zero,(){
      return jsonDecode(response.body);
    });
    notifyListeners();
  }
}