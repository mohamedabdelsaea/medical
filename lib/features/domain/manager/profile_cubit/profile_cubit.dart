import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/auth/profile_service.dart';
import '../../../data/model/auth_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  AuthModel? profile;

  Future<void> loadProfile() async {
    profile = await ProfileService.getProfile();
    emit(ProfileLoadedState());
  }
}
