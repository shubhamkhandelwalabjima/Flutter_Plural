import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/resources/Components/round_buttons.dart';
import 'package:flutter_architecture/utils/general_utils.dart';
import 'package:flutter_architecture/utils/routes/routes_name.dart';
import 'package:flutter_architecture/view_model/auth_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.person),
                    labelText: "Email"),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      // keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              child: Icon(_obsecurePassword.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded),
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              }),
                          hintText: "Password",
                          prefixIcon: Icon(Icons.key_outlined),
                          labelText: "Password"),
                      obscureText: _obsecurePassword.value,
                    );
                  }),
              SizedBox(
                height: height * .085,
              ),
              RoundButton(
                loading: authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage("Please Enter Email", context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Please Enter Password", context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        "Please Enter 6 Digits Password", context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data, context);
                    print("Api Hitted");
                  }
                },
                title: 'Login',
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                child: Text("Don't Have An Account ? SignUp"),
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signup);
                },
              )
            ],
          ),
        ));
  }
}
