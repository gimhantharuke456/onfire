import 'package:flutter/material.dart';
import 'package:onfire/utils/index.dart';
import 'package:onfire/views/login.activity.dart';
import 'package:onfire/views/onboarding.view.one.dart';
import 'package:onfire/widgets/custom.button.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png"),
            CustomButton(
              text: "START",
              onTap: () {
                context.navigator(
                    context,
                    OnboardingViewOne(
                      imagePath: "assets/img1.png",
                      onNext: () {
                        context.navigator(
                          context,
                          OnboardingViewOne(
                              onNext: () {
                                context.navigator(
                                  context,
                                  OnboardingViewOne(
                                      onNext: () {
                                        context.navigator(
                                          context,
                                          OnboardingViewOne(
                                              onNext: () {
                                                context.navigator(
                                                  context,
                                                  OnboardingViewOne(
                                                      onNext: () {
                                                        context.navigator(
                                                          context,
                                                          OnboardingViewOne(
                                                              onNext: () {
                                                                context
                                                                    .navigator(
                                                                  context,
                                                                  LoginView(),
                                                                );
                                                              },
                                                              imagePath:
                                                                  "assets/img5.png"),
                                                        );
                                                      },
                                                      imagePath:
                                                          "assets/img4.png"),
                                                );
                                              },
                                              imagePath: "assets/img3.png"),
                                        );
                                      },
                                      imagePath: "assets/img2.png"),
                                );
                              },
                              imagePath: "assets/img2.png"),
                        );
                      },
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
