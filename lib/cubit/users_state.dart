import '../models/user_model.dart';

/// Base state for UsersCubit.
abstract class UsersState {
  const UsersState();
}

/// Initial state before any fetch request is initiated.
class UsersInitial extends UsersState {
  const UsersInitial();
}

/// State emitted while fetching user data.
class UsersLoading extends UsersState {
  const UsersLoading();
}

/// State emitted when user data is successfully fetched.
class UsersSuccess extends UsersState {
  final List<User> users;

  const UsersSuccess(this.users);
}

/// State emitted when an error occurs during fetch.
class UsersFailure extends UsersState {
  final String message;

  const UsersFailure(this.message);
}
