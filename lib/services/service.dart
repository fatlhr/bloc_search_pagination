import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/issues_model.dart';
import '../models/repo_model.dart';
import '../models/user_model.dart';
import '../utils/api.dart';

class Service {
  static Future<UserModel?> getUsers(
    String input,
    int page,
    int perPage,
  ) async {
    String url =
        Api.api + "/search/users?q=$input&page=$page&per_page=$perPage";

    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var dataModels = UserModel.fromJson(json.decode(res.body));

      return dataModels;
    } else {
      return null;
    }
  }

  static Future<List<RepoItems>> getRepo(
      String input, int page, int perPage) async {
    String url =
        "https://api.github.com/search/repositories?q=$input&page=page&per_page=$perPage";

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
    String url =
        "https://api.github.com/search/issues?q=$input&page=page&per_page=$perPage";
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
