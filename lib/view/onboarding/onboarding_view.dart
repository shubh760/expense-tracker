import 'package:expense_tracker/consts/color_const.dart';
import 'package:expense_tracker/view/onboarding/onboarding_viewmodel.dart';
import 'package:expense_tracker/widget_helpers/app_text.dart';
import 'package:expense_tracker/widget_helpers/spacers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardingViewmodel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            verticalSpaceMedLarge,
            LinearProgressIndicator(
              value: model.progress,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: PageView.builder(
                    controller: model.pageController,
                    itemCount: model.buildScreen.length,
                    itemBuilder: (context, index) {
                      return model.buildScreen[index];
                    }),
              ),
            ),
            GestureDetector(
              onTap: () {
                model.changeIndex(context, model.bottomNavIndex + 1);
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient:
                        const LinearGradient(colors: colors.gradientColor)),
                child: Center(
                    child: AppText(
                  text: model.buttonText,
                  size: 20.0,
                  color: colors.tileColor,
                )),
              ),
            ),
            verticalSpaceRegular
          ],
        ),
      );
    });
  }
}
