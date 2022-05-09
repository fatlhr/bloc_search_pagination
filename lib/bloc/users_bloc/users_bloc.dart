import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';
import '../../services/service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersFetched>((event, emit) async {
      String searchResult = event.searchResult;
      emit(await _mapUsersToState(state, searchResult));
    });
    on<UsersRefresh>((event, emit) async {
      emit(UsersInitial());
      emit(await _mapUsersToState(state, ''));
    });
  }

  Future<UsersState> _mapUsersToState(
    UsersState state,
    String searchResult,
  ) async {
    try {
      if (state is UsersInitial) {
        final users = await Service.getUsers(searchResult, 1, 10);
        if (users == null) {
          return UsersInitial();
        }
        var totalPages = users.totalCount ~/ 10;
        return UsersLoaded(
          users: users.items,
          hasReachedMax: totalPages <= 1,
          currentPage: 1,
          perPage: 10,
        );
      }
      UsersLoaded usersloaded = state as UsersLoaded;
      final users = await Service.getUsers(
          searchResult, usersloaded.currentPage + 1, usersloaded.perPage);
      if (users == null) {
        return UsersInitial();
      }
      var totalPages = users.totalCount ~/ usersloaded.perPage;
      return UsersLoaded(
        users: usersloaded.users + users.items,
        hasReachedMax: totalPages <= usersloaded.currentPage + 1,
        totalPages: totalPages,
        currentPage: usersloaded.currentPage + 1,
        perPage: usersloaded.perPage,
      );
    } on Exception {
      return UsersError();
    }
  }
}
