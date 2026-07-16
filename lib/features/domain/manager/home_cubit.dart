import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:medical/features/data/model/doctor_home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int _selectedIndex = 0;

  Locale _locale = const Locale('en');


  final List<DoctorHomeModel> _doctorList = [
    DoctorHomeModel(
      name: 'Dr. Olivia Turner, M.D.',
      specialty: 'Dermato-Endocrinology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. James Wilson',
      specialty: 'Cardiology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Emma Johnson',
      specialty: 'Neurology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Noah Brown',
      specialty: 'Orthopedics',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Sophia Davis',
      specialty: 'Pediatrics',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Liam Miller',
      specialty: 'General Surgery',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Ava Anderson',
      specialty: 'Ophthalmology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. William Thomas',
      specialty: 'Psychiatry',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Isabella Moore',
      specialty: 'Obstetrics & Gynecology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Benjamin Martin',
      specialty: 'Urology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Charlotte Lee',
      specialty: 'Oncology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Henry White',
      specialty: 'Nephrology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Amelia Harris',
      specialty: 'Pulmonology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Lucas Clark',
      specialty: 'Gastroenterology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Mia Lewis',
      specialty: 'Rheumatology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Ethan Walker',
      specialty: 'Radiology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Harper Hall',
      specialty: 'Anesthesiology',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Alexander Young',
      specialty: 'Plastic Surgery',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Evelyn King',
      specialty: 'Family Medicine',
      image: 'assets/image/doctor2.png',
    ),
    DoctorHomeModel(
      name: 'Dr. Daniel Scott',
      specialty: 'Emergency Medicine',
      image: 'assets/image/doctor2.png',
    ),
  ];

  List<DoctorHomeModel> get doctorList => _doctorList ;

  Locale get locale => _locale;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    emit(SelectedHomeState());
  }

  void changeLanguage() {
    _locale = _locale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');

    log(_locale.languageCode);
    emit(ChangeLanguageState());
  }
}
