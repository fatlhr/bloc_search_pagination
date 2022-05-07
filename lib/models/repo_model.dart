class RepoModel {
  RepoModel({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });
  late final int totalCount;
  late final bool incompleteResults;
  late final List<RepoItems> items;

  RepoModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    items = List.from(json['items']).map((e) => RepoItems.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_count'] = totalCount;
    _data['incomplete_results'] = incompleteResults;
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class RepoItems {
  RepoItems({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.fork,
    required this.url,
    required this.issuesUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.forksCount,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    this.license,
    required this.allowForking,
    required this.isTemplate,
    required this.topics,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
    required this.score,
  });
  late final int id;
  late final String nodeId;
  late final String name;
  late final String fullName;
  late final bool private;
  late final Owner owner;
  late final String htmlUrl;
  late final bool fork;
  late final String url;
  late final String issuesUrl;
  late final String createdAt;
  late final String updatedAt;
  late final String pushedAt;
  late final int size;
  late final int stargazersCount;
  late final int watchersCount;
  late final String? language;
  late final bool hasIssues;
  late final bool hasProjects;
  late final bool hasDownloads;
  late final bool hasWiki;
  late final bool hasPages;
  late final int forksCount;
  late final bool archived;
  late final bool disabled;
  late final int openIssuesCount;
  late final License? license;
  late final bool allowForking;
  late final bool isTemplate;
  late final List<dynamic> topics;
  late final String visibility;
  late final int forks;
  late final int openIssues;
  late final int watchers;
  late final String defaultBranch;
  late final double score;

  RepoItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = Owner.fromJson(json['owner']);
    htmlUrl = json['html_url'];
    fork = json['fork'];
    url = json['url'];
   
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pushedAt = json['pushed_at'];
   
    size = json['size'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasDownloads = json['has_downloads'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    forksCount = json['forks_count'];
    archived = json['archived'];
    disabled = json['disabled'];
    openIssuesCount = json['open_issues_count'];
    allowForking = json['allow_forking'];
    isTemplate = json['is_template'];
    topics = List.castFrom<dynamic, dynamic>(json['topics']);
    visibility = json['visibility'];
    forks = json['forks'];
    openIssues = json['open_issues'];
    watchers = json['watchers'];
    defaultBranch = json['default_branch'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['node_id'] = nodeId;
    _data['name'] = name;
    _data['full_name'] = fullName;
    _data['private'] = private;
    _data['owner'] = owner.toJson();
    _data['html_url'] = htmlUrl;
    
    _data['fork'] = fork;
    _data['url'] = url;
   
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pushed_at'] = pushedAt;
    _data['size'] = size;
    _data['stargazers_count'] = stargazersCount;
    _data['watchers_count'] = watchersCount;
    _data['language'] = language;
    _data['has_issues'] = hasIssues;
    _data['has_projects'] = hasProjects;
    _data['has_downloads'] = hasDownloads;
    _data['has_wiki'] = hasWiki;
    _data['has_pages'] = hasPages;
    _data['forks_count'] = forksCount;
    _data['archived'] = archived;
    _data['disabled'] = disabled;
    _data['open_issues_count'] = openIssuesCount;
    _data['license'] = license;
    _data['allow_forking'] = allowForking;
    _data['is_template'] = isTemplate;
    _data['topics'] = topics;
    _data['visibility'] = visibility;
    _data['forks'] = forks;
    _data['open_issues'] = openIssues;
    _data['watchers'] = watchers;
    _data['default_branch'] = defaultBranch;
    _data['score'] = score;
    return _data;
  }
}

class Owner {
  Owner({
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

  Owner.fromJson(Map<String, dynamic> json) {
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

class License {
  License({
    required this.key,
    required this.name,
    required this.spdxId,
    required this.url,
    required this.nodeId,
  });
  late final String key;
  late final String name;
  late final String spdxId;
  late final String url;
  late final String nodeId;

  License.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    spdxId = json['spdx_id'];
    url = json['url'];
    nodeId = json['node_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    _data['name'] = name;
    _data['spdx_id'] = spdxId;
    _data['url'] = url;
    _data['node_id'] = nodeId;
    return _data;
  }
}
