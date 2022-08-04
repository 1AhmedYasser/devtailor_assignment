import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Constants/resources.dart';
import '../../Helpers/utils.dart';
import '../../Widgets/app_text_form_field.dart';
import '../../Widgets/dropdown_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  String? countryOfResidence;
  bool agreedWithTerms = false;
  String? selectedCountry;

  // TextField Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmationPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.images.devTailorbackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Form(
          key: _signUpFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
                top: 25,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    R.images.devTailorLogo,
                    width: 205,
                    height: 53,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 50),
                    child: Text(
                      R.constants.letsGetStarted,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DropDownField(
                      label: R.constants.countryOfResidence,
                      items: Utils.dropdownItems,
                      onSelection: (newCountry) {
                        selectedCountry = newCountry;
                      },
                    ),
                  ),
                  AppTextFormField(
                    label: R.constants.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (email) {
                      if (email.isEmpty) {
                        return R.constants.emptyEmail;
                      }
                      if (!Utils.isValidEmail(email)) {
                        return R.constants.wrongEmailFormat;
                      }
                      return null;
                    },
                  ),
                  AppTextFormField(
                    label: R.constants.createYourPassword,
                    controller: passwordController,
                    isPassword: true,
                    validator: (password) {
                      if (password.isEmpty) {
                        return R.constants.emptyPassword;
                      }
                      if (password != confirmationPasswordController.text) {
                        return R.constants.passwordNotMatching;
                      }
                      return null;
                    },
                  ),
                  AppTextFormField(
                    label: R.constants.reEnterPassword,
                    controller: confirmationPasswordController,
                    isPassword: true,
                    validator: (password) {
                      if (password.isEmpty) {
                        return R.constants.emptyPassword;
                      }
                      if (password != passwordController.text) {
                        return R.constants.passwordNotMatching;
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CheckboxListTile(
                      activeColor: R.colors.primaryColor,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: const BorderSide(color: Colors.grey, width: 1),
                      dense: true,
                      title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: R.constants.iAgreeWith,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ${R.constants.termsAndConditions}',
                                style: TextStyle(
                                  color: R.colors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      value: agreedWithTerms,
                      onChanged: (newValue) {
                        setState(() {
                          agreedWithTerms = newValue ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                        primary: R.colors.primaryColor,
                        elevation: 0,
                      ),
                      onPressed: () {
                        if (_signUpFormKey.currentState!.validate()) {
                          // TODO: Sign Up
                        }
                      },
                      child: Text(
                        R.constants.signUp,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Go To Login Screen
                      },
                      child: Text(
                        R.constants.logIn,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: R.colors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: TextButton(
                      onPressed: () {
                        // TODO: Go To Customer Support
                      },
                      child: Text(
                        R.constants.customerSupport,
                        style: TextStyle(
                          color: R.colors.primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
