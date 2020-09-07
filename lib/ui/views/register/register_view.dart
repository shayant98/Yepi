import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:yepi/ui/dumb_widgets/flat_button_widget.dart';
import 'package:yepi/ui/dumb_widgets/input_field.dart';
import 'package:yepi/ui/dumb_widgets/title_widget.dart';
import 'package:yepi/ui/views/register/register_viewmodel.dart';
import 'package:yepi/ui/views/startup/startup_viewmodel.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(
                    title: "Welcome User,",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please create an account\nto continue",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                  SizedBox(
                    height: 40,
                  ),
                  FormGroup(
                    label: "Name",
                    controller: model.nameController,
                    hint: "Name",
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormGroup(
                    label: "Surname",
                    controller: model.surnameController,
                    hint: "Surname",
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormGroup(
                    label: "Email",
                    controller: model.emailController,
                    hint: "Email",
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormGroup(
                    label: "Password",
                    controller: model.passwordController,
                    hint: "Password",
                    inputType: TextInputType.text,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormGroup(
                    label: "Repeat Password",
                    controller: model.passwordConfirmController,
                    hint: "Repeat Password",
                    inputType: TextInputType.text,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormGroup(
                    label: "Phone",
                    controller: model.phoneController,
                    hint: "Phone",
                    inputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => model.navigateToSignIn(),
                        child: Text(
                          "Already have an account? Sign in here",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      FlatButtonWidget(
                        isBusy: model.isBusy,
                        title: "Sign up",
                        onPressed: () {
                          model.signUp(
                              name: model.nameController.text,
                              surname: model.surnameController.text,
                              confirmPassword:
                                  model.passwordConfirmController.text,
                              phone: model.phoneController.text,
                              email: model.emailController.text,
                              password: model.passwordController.text);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}

class FormGroup extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final TextInputType inputType;

  const FormGroup(
      {Key key,
      this.label,
      this.controller,
      this.hint,
      this.isPassword,
      this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 5,
        ),
        InputFieldWidget(
            controller: controller,
            label: hint,
            inputType: inputType,
            isPassword: isPassword ?? false),
      ],
    );
  }
}
