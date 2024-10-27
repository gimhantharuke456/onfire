import 'package:flutter/material.dart';
import 'package:onfire/views/home.view.dart';
import 'package:onfire/widgets/custom.button.dart';

class RegisterSuccessfullView extends StatelessWidget {
  const RegisterSuccessfullView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 100,
                color: Color(0xFFFF5722), // Orange color
              ),
              const SizedBox(height: 24),
              const Text(
                'Registered Successfully',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Congratulations!You have been\nSuccessfully Registered.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFF5722), // Orange color
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                'OnFire',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                  color: Colors.black12,
                ),
              ),
              const Text(
                'AWESOME',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black26,
                ),
              ),
              const SizedBox(height: 48),
              CustomButton(
                text: 'Continue',
                onTap: () {
                  // Handle navigation here
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
