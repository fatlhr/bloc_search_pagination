part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class UsersFetched extends UsersEvent {
  // final String searchResult;
  // const UsersFetched(this.searchResult);
}

class UsersRefresh extends UsersEvent {}
