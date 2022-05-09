part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersUnInitialized extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersError extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoaded extends UsersState {
  final List<UserItems> users;
  final bool hasReachedMax;

  const UsersLoaded({
    this.users = const <UserItems>[],
    this.hasReachedMax = false,
  });

  UsersLoaded copyWith({
    List<UserItems>? users,
    bool? hasReachedMax,
    String? searchResult,
  }) {
    return UsersLoaded(
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [users, hasReachedMax];
}
