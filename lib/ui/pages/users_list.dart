import 'package:flutter/material.dart';
import 'package:sejutacita/bloc/users_bloc/users_bloc.dart';

import '../widgets/bottom_loader.dart';
import '../widgets/users_list_widget.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    Key? key,
    required this.state,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;
  final UsersLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: scrollController,
      itemCount:
          (state.hasReachedMax) ? state.users.length : state.users.length + 1,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 1);
      },
      itemBuilder: (context, index) {
        return index < state.users.length ? UsersItemWidget(
          avatar: state.users[index].avatarUrl,
          urlProfile: state.users[index].htmlUrl,
          username: state.users[index].login,
        ): const BottomLoader();
      },
    );
  }
}
