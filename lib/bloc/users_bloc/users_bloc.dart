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
      UsersState state, String searchResult) async {
    List<UserItems> users;
    try {
      if (searchResult == '') {
        if (state is UsersInitial) {
          return UsersInitial();
        }
      }

      if (searchResult != '') {
        users = await Service.getUsers(searchResult, 0, 10);
        return UsersLoaded(users: users);
      }
      
          
      UsersLoaded usersLoaded = state as UsersLoaded;
      users = await Service.getUsers(
          searchResult, usersLoaded.users.length, 10);

      return users.isEmpty
          ? usersLoaded.copyWith(hasReachedMax: true)
          : usersLoaded.copyWith(users: usersLoaded.users + users);
    } on Exception {
      return UsersError();
    }
  }
}
