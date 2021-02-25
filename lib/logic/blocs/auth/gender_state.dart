part of 'gender_bloc.dart';

@immutable
abstract class GenderState {
  final String choosedGender;
  const GenderState(this.choosedGender);
}

class GenderInitial extends GenderState {
  GenderInitial(String choosedGender) : super(choosedGender);
}

class GenderIsMale extends GenderState {
  GenderIsMale({String choosedGender = 'Male'}) : super(choosedGender);

}

class GenderIsFemale extends GenderState {
  GenderIsFemale({String choosedGender = 'Female'}) : super(choosedGender);

}
class GenderIsOther extends GenderState {
  GenderIsOther({String choosedGender = 'Other'}) : super(choosedGender);

}