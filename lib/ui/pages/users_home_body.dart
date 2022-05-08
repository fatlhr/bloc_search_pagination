import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/users_bloc/users_bloc.dart';
import '../widgets/null_widget.dart';
import 'users_list.dart';

class UsersHomeBody extends StatefulWidget {
  const UsersHomeBody({
    Key? key,
    //required this.searchResult,
  }) : super(key: key);

  //final String searchResult;
  @override
  State<UsersHomeBody> createState() => _UsersHomeBodyState();
}

class _UsersHomeBodyState extends State<UsersHomeBody> {
  final ScrollController _scrollController = ScrollController();
  late UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _usersBloc = context.read<UsersBloc>();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    // _usersBloc = BlocProvider.of<UsersBloc>(context);
    // scrollController.addListener(_onScroll);
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state is UsersInitial) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: Text('Search Something...'),
            ),
          );
        }
        if (state is UsersLoaded) {
          if (state.users.isEmpty) {
            return const NullWidget();
          }
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: UsersList(
              state: state,
              scrollController: _scrollController,
            ),
          );
        }
        return const Center(
          child: Text('Failed to fetched user'),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    _usersBloc.add(UsersRefresh());
  }

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      _usersBloc.add(UsersFetched());
    }
  }
}
