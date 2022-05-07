import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';
import '../../services/service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial());

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is UsersFetched) {
      //String searchResult = event.searchResult;
      yield await _mapUsersToState(state);
      // yield UsersUnInitialized();
      // try {
      //   UsersLoaded usersLoaded = state as UsersLoaded;
      //   List<UserItems> userItems =
      //       await Service.getUsers(event.searchResult, 0, 10);
      //   yield userItems.isEmpty
      //       ? usersLoaded.copyWith(hasReachedMax: true)
      //       : usersLoaded.users.length < 10
      //           ? usersLoaded.copyWith(hasReachedMax: true)
      //           : usersLoaded.copyWith(users: usersLoaded.users + userItems);
      //  // UsersLoaded(users: userItems);
      // } catch (e) {}
    } else if (event is UsersRefresh) {
      yield UsersInitial();
      yield await _mapUsersToState(state);
    }
  }

  Future<UsersState> _mapUsersToState(UsersState state) async { 
    List<UserItems> users;
    try {
      if (state is UsersInitial) {
        users = await Service.getUsers('flutter', 0, 5);
        return UsersLoaded(
          users: users,
        );
      }

      UsersLoaded usersLoaded = state as UsersLoaded;
      users = await Service.getUsers('flutter', usersLoaded.users.length, 5);

      return users.isEmpty
          ? usersLoaded.copyWith(hasReachedMax: true)
          // : usersLoaded.users.length < 5
          //     ? usersLoaded.copyWith(hasReachedMax: true)
              : usersLoaded.copyWith(users: usersLoaded.users + users);
    } on Exception {
      return UsersError();
    }
  }
}
