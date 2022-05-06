import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/issues_model.dart';
import '../models/repo_model.dart';
import '../models/user_model.dart';

class Service {
  static Future<List<UserModelItems>> getUser() async {
    String url = "https://api.github.com/search/users?q=doraemon";

    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = (jsonDecode(res.body))['items'];
      var searchUser = List<UserModelItems>.from(
          data.map((item) => UserModelItems.fromJson(item)));
      print(searchUser);
      return searchUser;
    }
    throw Exception('Failed to load');
  }

  // static Future<List<RepoModelItems>> getRepo() async {
  //   String url = "https://api.github.com/search/repositories?q=doraemon";

  //   var res = await http.get(Uri.parse(url));
  //   if (res.statusCode == 200) {
  //     var data = (jsonDecode(res.body))['items'];
  //     var searchRepo = List<RepoModelItemsLicense>.from(
  //         data.map((item) => RepoModelItemsLicense.fromJson(item)));
  //     print(searchRepo);
  //     return searchRepo;
  //   }
  //   throw Exception('Failed to load');
  // }

  static Future<List<RepoItems>> getRepoOwner() async {
    String url = "https://api.github.com/search/repositories?q=doraemon";

    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = (jsonDecode(res.body))['items'];
      var searchRepoOwner = List<RepoItems>.from(
          data.map((item) => RepoItems.fromJson(item)));
      //print(searchRepoOwner[0].owner.avatarUrl);
      return searchRepoOwner;
    }
    throw Exception('Failed to load');
  }
  
  static Future<List<IssuesItems>> getIssues() async {
    String url = "https://api.github.com/search/issues?q=flutter";

    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var data = (jsonDecode(res.body))['items'];
      var searchIssues =
          List<IssuesItems>.from(data.map((item) => IssuesItems.fromJson(item)));
      print(searchIssues[0].title);
      return searchIssues;
    }
    throw Exception('Failed to load');
  }
}
