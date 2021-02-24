import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {

  const Name.pure([String value = '']) : super.pure(value);
  const Name.dirty([String value = '']) : super.dirty(value);

  static final _necessaryRegex = RegExp(
      r"([A-ZА-Я][A-ZА-Яа-яa-z ]*)+"
  );

  @override
  NameValidationError validator(String value) {
    return _necessaryRegex.hasMatch(value) ? null : NameValidationError.invalid;
  }
}