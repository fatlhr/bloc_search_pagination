// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic selectedValue = 0;
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
                  suffixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return selectedValue == 1
                      ? buildUserWidget()
                      : selectedValue == 2
                          ? buildIssuesWidget()
                          : buildRepoWidget();
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildRepoWidget() {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: kToolbarHeight - 10,
          height: kToolbarHeight - 10,
        ),
        child: Image.asset('assets/images/pic.jpg'),
      ),
      title: Text(
        'Repo Title',
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(16),
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        'Created Date',
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(12),
          color: Colors.grey,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Total Watchers',
            maxLines: 1,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10),
              color: Colors.grey,
            ),
          ),
          Text(
            'Total Stars',
            maxLines: 1,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(10),
              color: Colors.grey,
            ),
          ),
          Text(
            'Total Forks',
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

  Widget buildUserWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: kToolbarHeight - 10,
            height: kToolbarHeight - 10,
          ),
          child: Image.asset('assets/images/pic.jpg'),
        ),
        title: Text(
          'Username',
          maxLines: 1,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(18),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  ListTile buildIssuesWidget() {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: kToolbarHeight - 10,
          height: kToolbarHeight - 10,
        ),
        child: Image.asset('assets/images/pic.jpg'),
      ),
      title: Text(
        'Issues Title',
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(16),
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        'Update dates',
        maxLines: 1,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(12),
          color: Colors.grey,
        ),
      ),
      trailing: Column(
        children: [
          Text(
            'Issues',
            maxLines: 1,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              color: Colors.grey,
            ),
          ),
          Text(
            'Dates',
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
