// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New user'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Username',
              onChanged: (value) => username = value,
              validator: (value) {
                if (value == null) {
                  return 'Please enter your username';
                }
                if (value.trim().isEmpty) {
                  return 'Please enter your username';
                }
                if (value.trim().length < 6) {
                  return 'Username must be at least 6 characters long';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              label: 'Email',
              onChanged: (value) => email = value,
              validator: (value) {
                if (value == null) {
                  return 'Please enter your email';
                }
                if (value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
                if (!emailRegExp.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              label: 'Password',
              onChanged: (value) => password = value,
              obscureText: true,
              validator: (value) {
                if (value == null) {
                  return 'Please enter your password';
                }
                if (value.trim().isEmpty) {
                  return 'Please enter your password';
                }
                if (value.trim().length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) {
                  return;
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('New user'),
            ),
          ],
        ));
  }
}