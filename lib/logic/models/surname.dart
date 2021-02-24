import 'package:formz/formz.dart';

enum SurnameValidationError { invalid }

class Surname extends FormzInput<String, SurnameValidationError> {

  const Surname.pure([String value = '']) : super.pure(value);
  const Surname.dirty([String value = '']) : super.dirty(value);

  static final _necessaryRegex = RegExp(
      r"([A-ZА-Я][A-ZА-Яа-яa-z ]*)+"
  );

  @override
  SurnameValidationError validator(String value) {
    return _necessaryRegex.hasMatch(value) ? null : SurnameValidationError.invalid;
  }
}