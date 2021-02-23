part of 'gender_bloc.dart';

@immutable
abstract class GenderState {
  final int choosedGender;
  const GenderState(this.choosedGender);
}

class GenderInitial extends GenderState {
  GenderInitial(int choosedGender) : super(choosedGender);
}

class GenderIsMale extends GenderState {
  GenderIsMale({int choosedGender = 0}) : super(choosedGender);

}

class GenderIsFemale extends GenderState {
  GenderIsFemale({int choosedGender = 1}) : super(choosedGender);

}

class GenderIsOther extends GenderState {
  GenderIsOther({int choosedGender = 2}) : super(choosedGender);

}