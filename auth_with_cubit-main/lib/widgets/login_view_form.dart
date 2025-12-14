import 'package:auth_with_cubit/cubits/login_cubit/login_cubit.dart';
import 'package:auth_with_cubit/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_button.dart';
import 'password_form_field.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  String? email;
  String? password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.onUnfocus;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: _formKey,
        child: Column(
          children: [
            // Email Field
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            PasswordFormField(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 12),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Implement forgot password
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF667eea),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: state is LoginLoading,
                  child: CustomButton(
                    isLoading: state is LoginLoading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<LoginCubit>().login(
                          email: email!,
                          password: password!,
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.onUserInteraction;
                        setState(() {});
                      }
                    },
                    text: 'Login',
                    color: const Color(0xFF667eea),
                    shadowColor: const Color(0xFF667eea).withOpacity(0.5),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
// create states 
// create cubit 
// add logic 
// provide cubit
// integrate cubit with ui 