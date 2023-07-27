// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_monster/Screens/Signup.dart';
import 'package:water_monster/controller.dart';
import 'package:validators/validators.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   email_txt.dispose();
  //   password_txt.dispose();
  // }
  final formKey = GlobalKey<FormState>();
  String? _name, _email, _password;

  @override
  Widget build(BuildContext context) {
    final oheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome',
          style: GoogleFonts.nunito(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sign In',
                style: GoogleFonts.nunito(
                  fontSize: 30,
                  color: const Color.fromRGBO(40, 140, 255, 10),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: mwidth / 1.2, //!temp number till i make it flexsible
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter vaild email';
                    }
                    if (!isEmail(value)) {
                      return 'Please enter vaild email';
                    }
                    print(value);
                    return null;
                  },
                  onSaved: (newValue) {
                    _email = newValue!;
                  },
                  controller: email_txt,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: const Color.fromRGBO(40, 140, 255, 10),
                      labelText: 'Email',
                      hintText: '',
                      hintStyle: GoogleFonts.nunito(
                        color: const Color.fromRGBO(40, 140, 255, 2),
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: const EdgeInsets.all(7.5),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.5)),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: mwidth / 1.2, //!temp number till i make it flexsible
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter password';
                    }
                    if (value.length < 9) {
                      return 'Password doesnot match';
                    }
                    return null;
                  },
                  controller: password_txt,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(FontAwesomeIcons.lock),
                      prefixIconColor: const Color.fromRGBO(40, 140, 255, 10),
                      labelText: 'Password',
                      hintText: '',
                      hintStyle: GoogleFonts.nunito(
                        color: const Color.fromRGBO(40, 140, 255, 2),
                        fontWeight: FontWeight.bold,
                      ),
                      contentPadding: const EdgeInsets.all(7.5),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.5)),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    final SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('email', email_txt.text);

                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const Home();
                        },
                      ));
                    }
                    {
                      return;
                    }
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStatePropertyAll(GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                    overlayColor: const MaterialStatePropertyAll(Colors.green),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(40, 140, 255, 10)),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 50, vertical: 0)),
                  ),
                  icon: const Icon(Icons.login),
                  label: const Text('Sign In')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Dont have account?',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const SignUp();
                          },
                        ));
                      },
                      child: Text(
                        'SignUp',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('ok'))
                            ],
                            title: const Text('NOT FINAL RESULT'),
                          ),
                        );
                      },
                      child: Text(
                        'ForgetPassword',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Text(
                    '________ Or ________',
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Sign in with google');
                        },
                        child: SvgPicture.asset(
                          'Assets/svg/google.svg',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Sign in with metamask');
                        },
                        child: SvgPicture.asset(
                          'Assets/svg/metamask.svg',
                          width: 30,
                          height: 30,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
