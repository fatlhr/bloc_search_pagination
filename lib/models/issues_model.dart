import 'dart:core';

class IssuesModel {
  IssuesModel({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });
  late final double totalCount;
  late final bool incompleteResults;
  late final List<IssuesItems> items;

  IssuesModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    items = List.from(json['items']).map((e) => IssuesItems.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_count'] = totalCount;
    _data['incomplete_results'] = incompleteResults;
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class IssuesItems {
  IssuesItems({
    required this.url,
    required this.repositoryUrl,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.state,
    required this.locked,
    required this.assignees,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.closedAt,
    required this.authorAssociation,
    required this.body,
    required this.timelineUrl,
    required this.score,
  });
  late final String url;
  late final String repositoryUrl;
  late final String labelsUrl;
  late final String commentsUrl;
  late final String eventsUrl;
  late final String htmlUrl;
  late final int id;
  late final String nodeId;
  late final int number;
  late final String title;
  late final User user;
  late final List<dynamic> labels;
  late final String state;
  late final bool locked;
  late final List<dynamic> assignees;
  late final int comments;
  late final String createdAt;
  late final String updatedAt;
  late final String closedAt;
  late final String authorAssociation;
  late final String body;
  late final String timelineUrl;
  late final double score;

  IssuesItems.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    repositoryUrl = json['repository_url'];
    labelsUrl = json['labels_url'];
    commentsUrl = json['comments_url'];
    eventsUrl = json['events_url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    user = User.fromJson(json['user']);
    labels = List.castFrom<dynamic, dynamic>(json['labels']);
    state = json['state'];
    locked = json['locked'];
    assignees = List.castFrom<dynamic, dynamic>(json['assignees']);
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    closedAt = json['closed_at'] ?? "";
    authorAssociation = json['author_association'];
    body = json['body']??"";
    timelineUrl = json['timeline_url'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['repository_url'] = repositoryUrl;
    _data['labels_url'] = labelsUrl;
    _data['comments_url'] = commentsUrl;
    _data['events_url'] = eventsUrl;
    _data['html_url'] = htmlUrl;
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['number'] = number;
    _data['title'] = title;
    _data['user'] = user.toJson();
    _data['labels'] = labels;
    _data['state'] = state;
    _data['locked'] = locked;
    _data['assignees'] = assignees;
    _data['comments'] = comments;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['closed_at'] = closedAt;
    _data['author_association'] = authorAssociation;
    _data['body'] = body;
    _data['timeline_url'] = timelineUrl;
    _data['score'] = score;
    return _data;
  }
}

class User {
  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });
  late final String login;
  late final int id;
  late final String nodeId;
  late final String avatarUrl;
  late final String gravatarId;
  late final String url;
  late final String htmlUrl;
  late final String followersUrl;
  late final String followingUrl;
  late final String gistsUrl;
  late final String starredUrl;
  late final String subscriptionsUrl;
  late final String organizationsUrl;
  late final String reposUrl;
  late final String eventsUrl;
  late final String receivedEventsUrl;
  late final String type;
  late final bool siteAdmin;

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['avatar_url'] = avatarUrl;
    _data['gravatar_id'] = gravatarId;
    _data['url'] = url;
    _data['html_url'] = htmlUrl;
    _data['followers_url'] = followersUrl;
    _data['following_url'] = followingUrl;
    _data['gists_url'] = gistsUrl;
    _data['starred_url'] = starredUrl;
    _data['subscriptions_url'] = subscriptionsUrl;
    _data['organizations_url'] = organizationsUrl;
    _data['repos_url'] = reposUrl;
    _data['events_url'] = eventsUrl;
    _data['received_events_url'] = receivedEventsUrl;
    _data['type'] = type;
    _data['site_admin'] = siteAdmin;
    return _data;
  }
}
