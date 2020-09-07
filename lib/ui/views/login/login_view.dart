import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:yepi/ui/dumb_widgets/flat_button_widget.dart';
import 'package:yepi/ui/dumb_widgets/input_field.dart';
import 'package:yepi/ui/dumb_widgets/title_widget.dart';
import 'package:yepi/ui/views/startup/startup_viewmodel.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
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
                    title: "Welcome Back,",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please log into your account\nto continue",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
                  SizedBox(
                    height: 50,
                  ),
                  Text("Email"),
                  SizedBox(
                    height: 5,
                  ),
                  InputFieldWidget(
                    controller: model.emailController,
                    inputType: TextInputType.emailAddress,
                    label: "eg. example@example.com",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Password"),
                  SizedBox(
                    height: 5,
                  ),
                  InputFieldWidget(
                    controller: model.passwordController,
                    label: "Password",
                    inputType: TextInputType.text,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 12))),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => model.navigateToSignUp(),
                        child: Text(
                          "No account? Create one here",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      FlatButtonWidget(
                        isBusy: model.isBusy,
                        title: "Login",
                        onPressed: () {
                          model.signIn(
                              email: model.emailController.text,
                              password: model.passwordController.text);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text("Or Login with:"),
                        SizedBox(
                          height: 10,
                        ),
                        ClipOval(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              color: Color(0xFF2E4057),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
