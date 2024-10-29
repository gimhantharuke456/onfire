import 'package:flutter/material.dart';
import 'package:onfire/services/auth.service.dart';
import 'package:onfire/utils/index.dart';
import 'package:onfire/views/home.view.dart';
import 'package:onfire/views/register.view.dart';
import 'package:onfire/views/splash.view.dart';
import 'package:onfire/widgets/custom.button.dart';
import 'package:onfire/widgets/custom.input.field.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();

  final _systemCodeController = TextEditingController();

  final _authService = AuthService();

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
                'Login',
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
                controller: _usernameController,
                label: 'User name',
              ),
              const SizedBox(height: 24),
              CustomInputField(
                controller: _systemCodeController,
                label: 'System Code',
              ),
              const SizedBox(height: 48),
              Center(
                child: CustomButton(
                  text: 'Login',
                  onTap: () {
                    _handleLogin(context);
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ? "),
                    TextButton(
                      onPressed: () {
                        context.navigator(context, RegisterView());
                      },
                      child: Text("Register Now"),
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

  void _handleLogin(BuildContext context) async {
    final result = await _authService.login(
      email: _usernameController.text.trim(),
      systemCode: _systemCodeController.text.trim(),
    );

    if (result['success']) {
      context.navigator(context, HomeView());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result['message']),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
