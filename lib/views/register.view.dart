import 'package:flutter/material.dart';
import 'package:onfire/services/auth.service.dart';
import 'package:onfire/utils/index.dart';
import 'package:onfire/views/login.activity.dart';
import 'package:onfire/views/register.successfull.view.dart';
import 'package:onfire/widgets/custom.button.dart';
import 'package:onfire/widgets/custom.input.field.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();

  final _usernameController = TextEditingController();

  final _systemCodeController = TextEditingController();

  final _authService = AuthService();

  void _handleRegistration(BuildContext context) async {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    final result = await _authService.signUp(
      email: _emailController.text.trim(),
      username: _usernameController.text.trim(),
      systemCode: _systemCodeController.text.trim(),
    );

    // Hide loading indicator
    Navigator.pop(context);

    if (result['success']) {
      context.navigator(context, const RegisterSuccessfullView());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Registration',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'AWESOME',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              CustomInputField(
                controller: _emailController,
                label: 'Email',
              ),
              const SizedBox(height: 24),
              CustomInputField(
                controller: _usernameController,
                label: 'User Name',
              ),
              const SizedBox(height: 24),
              CustomInputField(
                controller: _systemCodeController,
                label: 'System Code',
              ),
              const SizedBox(height: 48),
              Center(
                child: CustomButton(
                  text: 'Register',
                  onTap: () {
                    _handleRegistration(context);
                  },
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Already have an account ? "),
                    TextButton(
                      onPressed: () {
                        context.navigator(context, LoginView());
                      },
                      child: Text("Login Now"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
