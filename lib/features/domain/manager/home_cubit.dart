import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

   int _selectedIndex = 0;

   int get selectedIndex => _selectedIndex;


  void changeIndex(int index) {
    _selectedIndex = index;
    emit(SelectedHomeState());
  }

}
