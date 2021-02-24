import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:washbox/logic/models/middle_name.dart';

import 'package:washbox/logic/models/password.dart';
import 'package:washbox/logic/models/phone.dart';
import 'package:washbox/logic/models/name.dart';
import 'package:washbox/logic/models/surname.dart';
import 'package:washbox/logic/models/email.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState());

  @override
  Stream<LoginFormState> mapEventToState(LoginFormEvent event) async* {
    if (event is PhoneChanged) {
      final phone = Phone.dirty(event.phone);
      yield state.copyWith(
        phone: phone.valid ? phone : Phone.pure(event.phone),
        status: Formz.validate([phone, state.password]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.phone, password]),
      );
    } else if (event is NameChanged) {
      final name = Name.dirty(event.name);
      yield state.copyWith(
        name: name.valid ? name : Name.pure(event.name),
        status: Formz.validate([
          state.phone,
          state.password,
          name,
          state.middleName,
          state.surname]),);
    } else if (event is MiddleNameChanged) {
      final middleName = MiddleName.dirty(event.middleName);
      yield state.copyWith(
        middleName: middleName.valid ? middleName : MiddleName.pure(event.middleName),
        status: Formz.validate([
          state.phone,
          state.password,
          state.name,
          middleName,
          state.surname
        ]),
      );
    } else if (event is SurnameChanged) {
      final surname = Surname.dirty(event.surname);
      yield state.copyWith(
        surname: surname.valid ? surname : Surname.pure(event.surname),
        status: Formz.validate([
          state.phone,
          state.password,
          state.name,
          state.middleName,
          surname]),
      );
    } else if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([
          state.phone,
          state.password,
          state.name,
          state.middleName,
          state.surname,
          email]),
      );
    } else if (event is PhoneUnfocused) {
      final phone = Phone.dirty(state.phone.value);
      yield state.copyWith(
        phone: phone,
        status: Formz.validate([phone, state.password]),
      );
    } else if (event is PasswordUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.phone, password]),
      );
    } else if (event is NameUnfocused) {
      final name = Name.dirty(state.name.value);
      yield state.copyWith(
        name: name,
        status: Formz.validate([state.phone, state.password, name]),
      );
    } else if (event is MiddleNameUnfocused) {
      final middleName = MiddleName.dirty(state.middleName.value);
      yield state.copyWith(
        middleName: middleName,
        status: Formz.validate([state.phone, state.password, state.name, middleName]),
      );
    } else if (event is SurnameUnfocused) {
      final surname = Surname.dirty(state.surname.value);
      yield state.copyWith(
        surname: surname,
        status: Formz.validate([state.phone, state.password, state.name, state.middleName, surname]),
      );
    } else if (event is EmailUnfocused) {
      final email = Email.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([state.phone, state.password, state.name, state.middleName, state.surname, email]),
      );
    } else if (event is AddressChanged) {
      final address = event.address;
      yield state.copyWith(
          address: address);
    } else if (event is GenderChanged) {
      final gender = event.gender;
      yield state.copyWith(
          gender: gender);
    } else if (event is LoginFormSubmitted) {
      final phone = Phone.dirty(state.phone.value);
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        phone: phone,
        password: password,
        status: Formz.validate([phone, password]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        //TODO  yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    } else if (event is RegisterFormSubmitted) {
      final phone = Phone.dirty(state.phone.value);
      final password = Password.dirty(state.password.value);
      final name = Name.dirty(state.name.value);
      final middleName = MiddleName.dirty(state.middleName.value);
      final surname = Surname.dirty(state.surname.value);
      yield state.copyWith(
        phone: phone,
        password: password,
        name: name,
        middleName: middleName,
        surname: surname,
        status: Formz.validate([phone, password, name, middleName, surname]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        //TODO  yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    } else if (event is VisibilityChanged) {
      final hidden = !event.hidden;
      yield state.copyWith(
          hidden: hidden);
    }
  }
}