import 'package:flutter/material.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../main.dart';
import '../../../data/widgets/custom_button.dart';
import '../../../data/widgets/custom_text_form_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var local = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.primary),
        ),
        title: Text(
          "Update Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipOval(
                  child: Image.asset(
                    "assets/image/profile.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                local!.fullName,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                width: size.width * 0.9,
                isPassword: false,
                hintText: "Enter Your Full Name",
              ),
              SizedBox(height: 10),
              Text(
                local.phone,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                width: size.width * 0.9,
                isPassword: false,
                hintText: "+20112233456",
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(height: 10),
              Text(
                local.email,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                width: size.width * 0.9,
                isPassword: false,
                hintText: "Enter Your Email",
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Text(
                local.dateOfBirth,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                width: size.width * 0.9,
                isPassword: false,
                hintText: "DD / MM / YYYY",
              ),
              SizedBox(height: size.height*0.1),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: "Update Profile",
                  buttonColor: AppColor.primary,
                  textColor: AppColor.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
