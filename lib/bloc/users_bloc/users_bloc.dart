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
      yield await _mapUsersToState(state);
    }
    if (event is UsersRefresh) {
      yield UsersInitial();

      yield await _mapUsersToState(state);
    }
  }

  Future<UsersState> _mapUsersToState(UsersState state) async {
    List<UserItems> users;

    try {
      if (state is UsersInitial) {
        users = await Service.getUsers('flutter', 0, 10);
        return UsersLoaded(users: users);
      }
      UsersLoaded postLoaded = state as UsersLoaded;
      users = await Service.getUsers('flutter', postLoaded.users.length, 10);
      return users.isEmpty
          ? postLoaded.copyWith(hasReachedMax: true)
          : postLoaded.copyWith(users: postLoaded.users + users);
    } on Exception {
      return UsersError();
    }
  }
}
