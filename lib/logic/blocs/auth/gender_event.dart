part of 'gender_bloc.dart';

@immutable
abstract class GenderEvent {
  const GenderEvent();
}

class GenderSetMale extends GenderEvent {
  
}

class GenderSetFemale extends GenderEvent {

}

class GenderSetOther extends GenderEvent {

}