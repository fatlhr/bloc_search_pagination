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
  final int currentPage;
  final int totalPages;
  final int perPage;

  const UsersLoaded({
    this.users = const <UserItems>[],
    this.hasReachedMax = false,
    this.currentPage = 0,
    this.totalPages = 0,
    this.perPage = 0,
  });

  UsersLoaded copyWith({
    List<UserItems>? users,
    bool? hasReachedMax,
    String? searchResult,
    int? currentPage,
    int? totalPages,
    int? perPage,
  }) {
    return UsersLoaded(
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  List<Object> get props => [
        users,
        hasReachedMax,
        currentPage,
        totalPages,
        perPage,
      ];
}
