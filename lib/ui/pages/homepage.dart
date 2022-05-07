// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/users_bloc/users_bloc.dart';
import 'users_home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  dynamic selectedValue = 1;
  String searchResult = "";
  TextEditingController searchController = TextEditingController();
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 50.0);

  @override
  Widget build(BuildContext context) {
    //final _usersBloc = BlocProvider.of<UsersBloc>(context);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              centerTitle: true,
              title: TextField(
                enabled: true,
                decoration: InputDecoration(
                  hintText: 'sejutacita',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        searchResult = searchController.text;
                        print(searchResult);
                        //_usersBloc.add(UsersFetched(searchResult));
                      });
                    },
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                autofocus: true,
                controller: searchController,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      'User',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      'issues',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: 3,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Repositories',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                //Expanded(child: Container()),
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
              child: UsersHomeBody(
                //searchResult: searchResult,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
