import 'package:codeclanmobile/repositories/repositories.dart';
import 'package:codeclanmobile/services/api/models/user_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {}

class UserLoaded extends UserState {
  final UserDto user;

  const UserLoaded({@required this.user});
  @override
  List<Object> get props => [user];
}

// Events
abstract class UserEvents extends Equatable {
  const UserEvents();
  @override
  List<Object> get props => [];
}

class FetchUser extends UserEvents {}

class LoadUser extends UserEvents {}

//Define Blocs

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvents event) async* {
    UserRepository userRepository = UserRepository();
    if (event is LoadUser) {
      // final bool hasToken = await userRepository.hasToken();
      // if (hasToken) {
      yield UserLoading();
      final UserDto user = await userRepository.getUserProfile();

      yield UserLoaded(user: user);
      // } else

    }
    UserError();
    if (event is FetchUser) {
      yield UserLoading();

      try {
        final UserDto user = await userRepository.getUserProfile();

        yield UserLoaded(user: user);
      } catch (e) {}
    }
  }
}
