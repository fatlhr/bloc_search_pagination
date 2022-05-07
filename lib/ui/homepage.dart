// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool isLoading = true;

  @override
  void initState() {
    super.initState();
    //searchResult = "fatih";
  }

  dynamic selectedValue = 1;

  TextEditingController searchController = TextEditingController();
  String searchResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              centerTitle: true,
              //toolbarHeight: 200,
              title: TextField(
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: 'Search for something',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          searchResult = searchController.text;
                          print(searchResult);
                        });
                      },
                      icon: Icon(Icons.search, color: Colors.grey),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  autofocus: true,
                  controller: searchController,
                  onChanged: (value) {
                    searchResult = value;
                  }),
              bottom: PreferredSize(
                preferredSize: Size(
                  MediaQuery.of(context).size.width,
                  kToolbarHeight * 2,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: kToolbarHeight * 2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    horizontalTitleGap: 0,
                                    leading: Radio(
                                      value: 1,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    title: Text(
                                      'User',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(16),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    horizontalTitleGap: 0,
                                    leading: Radio(
                                      value: 2,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    title: Text(
                                      'issues',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(16),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    horizontalTitleGap: 0,
                                    leading: Radio(
                                      value: 3,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    title: Text(
                                      'Repositories',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(16),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                //flex: 1,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "btn 1",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                //flex: 1,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "btn 2",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FutureBuilder(
                future: Future.wait([
                  Service.getUser(searchResult, 1, 5),
                  Service.getIssues(searchResult, 1, 5),
                  Service.getRepo(searchResult, 1, 5),
                ]),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );

                    default:
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.data == null) {
                        return const Center(child: Text('No data found'));
                      } else {
                        var data = snapshot.data! as List;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: selectedValue == 1
                              ? data[0].length
                              : selectedValue == 2
                                  ? data[1].length
                                  : data[2].length,
                          itemBuilder: (context, index) {
                            return selectedValue == 1
                                ? buildUserWidget(
                                    data[0][index].avatarUrl,
                                    data[0][index].login,
                                    data[0][index].htmlUrl,
                                  )
                                : selectedValue == 2
                                    ? buildIssuesWidget(
                                        data[1][index].user.avatarUrl,
                                        data[1][index].title,
                                        data[1][index].updatedAt,
                                        data[1][index].htmlUrl,
                                        data[1][index].state,
                                      )
                                    : buildRepoWidget(
                                        data[2][index].owner.avatarUrl,
                                        data[2][index].name,
                                        data[2][index].watchersCount,
                                        data[2][index].createdAt,
                                        data[2][index].stargazersCount,
                                        data[2][index].forks,
                                      );
                          },
                        );
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserWidget(
    String avatar,
    String username,
    String urlProfile,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: kToolbarHeight - 10,
            height: kToolbarHeight - 10,
          ),
          child: InkWell(
              onTap: () async {
                var url = urlProfile;

                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Image.network(avatar)),
        ),
        title: Text(
          username,
          maxLines: 1,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  ListTile buildRepoWidget(
    String avatar,
    String title,
    int totalWatchers,
    String createdDate,
    int totalStars,
    int totalForks,
  ) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: kToolbarHeight - 10,
          height: kToolbarHeight - 10,
        ),
        child: Image.network(
          avatar,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        title,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(16),
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        'Created At: ' + createdDate,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(12),
          color: Colors.grey,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Total Watchers: ' + totalWatchers.toString(),
            maxLines: 1,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10),
              color: Colors.grey,
            ),
          ),
          Text(
            'Total Stars: ' + totalStars.toString(),
            maxLines: 1,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10),
              color: Colors.grey,
            ),
          ),
          Text(
            'Total Forks: ' + totalForks.toString(),
            maxLines: 1,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildIssuesWidget(
    String avatar,
    String title,
    String updatedDate,
    String issues,
    String state,
  ) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: kToolbarHeight - 10,
          height: kToolbarHeight - 10,
        ),
        child: Image.network(avatar, fit: BoxFit.contain),
      ),
      title: Text(
        title,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(16),
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        updatedDate,
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(12),
          color: Colors.grey,
        ),
      ),
      trailing: Column(
        children: [
          InkWell(
            onTap: () async {
              var url = issues;

              if (await canLaunchUrl(Uri.parse(issues))) {
                await launchUrl(Uri.parse(issues));
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              'Issues',
              maxLines: 1,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: Colors.blueAccent,
              ),
            ),
          ),
          Text(
            state,
            maxLines: 1,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
