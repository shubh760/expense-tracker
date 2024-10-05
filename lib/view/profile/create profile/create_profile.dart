import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/helper/route_helper.dart';
import 'package:expense_tracker/services/shared_preferences_service.dart';
import 'package:expense_tracker/view/dashboard/dashboard.dart';
import 'package:expense_tracker/view/profile/widgets/custom_textfield.dart';
import 'package:expense_tracker/widget_helpers/app_text.dart';
import 'package:expense_tracker/widget_helpers/spacers.dart';
import 'package:expense_tracker/widget_helpers/toast_msg.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final occupationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceRegular,
            const Align(
              alignment: Alignment.center,
              child: AppText(
                text: "Introduction",
                color: colors.textColor,
                size: 20.0,
              ),
            ),
            verticalSpaceRegular,
            const AppText(
              text: "Name",
              color: colors.textColor,
              size: 20.0,
            ),
            GradientTextField(
              controller: nameController,
            ),
            verticalSpaceRegular,
            const AppText(
              text: "Age",
              color: colors.textColor,
              size: 20.0,
            ),
            GradientTextField(
              controller: ageController,
            ),
            verticalSpaceRegular,
            const AppText(
              text: "Occupation",
              color: colors.textColor,
              size: 20.0,
            ),
            GradientTextField(
              controller: occupationController,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  if (nameController.text.isNotEmpty &&
                      ageController.text.isNotEmpty &&
                      occupationController.text.isNotEmpty) {
                    UserPreferences.saveUserDetails(
                        name: nameController.text,
                        age: ageController.text,
                        occupation: occupationController.text);
                    Go.removeAndGo(context, const Dashboard());
                  } else {
                    showToast(context, "Please Fill all the information");
                  }
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient:
                          const LinearGradient(colors: colors.gradientColor)),
                  child: const Center(
                      child: AppText(
                    text: "Continue",
                    size: 20.0,
                    color: colors.tileColor,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
