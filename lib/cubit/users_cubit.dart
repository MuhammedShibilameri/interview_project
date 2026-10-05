import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/user_api_service.dart';
import 'users_state.dart';

/// Cubit managing the business logic and state for user list fetching.
class UsersCubit extends Cubit<UsersState> {
  final UserApiService _apiService;

  UsersCubit(this._apiService) : super(const UsersInitial());

  /// Fetches users from the API and emits corresponding states.
  Future<void> fetchUsers() async {
    emit(const UsersLoading());
    try {
      final users = await _apiService.fetchUsers();
      emit(UsersSuccess(users));
    } on ApiException catch (e) {
      emit(UsersFailure(e.message));
    } catch (e) {
      emit(UsersFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }
}
