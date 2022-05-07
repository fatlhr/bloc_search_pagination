import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/issues_model.dart';
import '../models/repo_model.dart';
import '../models/user_model.dart';

class Service {
  static Future<List<UserItems>> getUser(
      String input, int page, int perPage) async {
    String url =
        "https://api.github.com/search/users?q=$input&page=page&per_page=$perPage";
    //String url = "https://api.github.com/search/users?q=$input";

    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = (jsonDecode(res.body))['items'] as List;
      var searchUser = List<UserItems>.from(
        data.map(
          (item) => UserItems.fromJson(item),
        ),
      );
      //print(searchUser[0].);
      return Future.delayed(const Duration(seconds: 6))
          .then((value) => searchUser);
    } else if (res.statusCode == 403) {
      throw Exception('403 Forbidden');
    }
    throw Exception('Failed to load ' + res.statusCode.toString());
  }

  static Future<List<RepoItems>> getRepo(
      String input, int page, int perPage) async {
    String url = "https://api.github.com/search/repositories?q=$input";
    // String url =
    //     "https://api.github.com/search/repositories?q=$input&page=page&per_page=$perPage";

    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = (jsonDecode(res.body))['items'];
      var searchRepo =
          List<RepoItems>.from(data.map((item) => RepoItems.fromJson(item)));
      //print(searchRepo[0].name);
      return Future.delayed(const Duration(seconds: 6))
          .then((value) => searchRepo);
    }
    throw Exception('Failed to load ' + res.statusCode.toString());
  }

  static Future<List<IssuesItems>> getIssues(
      String input, int page, int perPage) async {
    String url = "https://api.github.com/search/issues?q=$input";
    // String url =
    //     "https://api.github.com/search/issues?q=$input&page=page&per_page=$perPage";
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = (jsonDecode(res.body))['items'];
      var searchIssues = List<IssuesItems>.from(
          data.map((item) => IssuesItems.fromJson(item)));
      //print(searchIssues[0].);
      return Future.delayed(const Duration(seconds: 6))
          .then((value) => searchIssues);
    }
    throw Exception('Failed to load ' + res.statusCode.toString());
  }
}
