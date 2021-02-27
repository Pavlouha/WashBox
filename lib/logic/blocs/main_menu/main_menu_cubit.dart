import 'package:flutter_bloc/flutter_bloc.dart';

class MainMenuCubit extends Cubit<int> {

  MainMenuCubit() : super(0);

  void change(int page) => emit(page);
}
