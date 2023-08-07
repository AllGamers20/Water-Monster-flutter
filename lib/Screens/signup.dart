// ignore_for_file: file_names, void_checks, dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:validators/validators.dart';
import 'package:water_monster/Screens/home.dart';
import 'package:water_monster/Screens/login.dart';
import 'package:water_monster/Screens/provider.dart';
import 'package:water_monster/controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   new_email_txt.dispose();
  //   super.dispose();
  // }
  final formKey = GlobalKey<FormState>();
  String? _name, _email, _password;
  List<String> items = ["Client", "Provider"];
  String? selecteditem = "Client";

  Future<void> signinwithgoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleuser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleauth =
        await googleuser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleauth.accessToken,
      idToken: googleauth.idToken,
    );
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
  }

  Future<void> createAccount() async {
    FirebaseAuth emailpasswordauth = FirebaseAuth.instance;
    emailpasswordauth.createUserWithEmailAndPassword(
        email: new_email_txt.text, password: new_password_txt.text);
  }

  @override
  Widget build(BuildContext context) {
    final oheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'Welcome',
      //     style: GoogleFonts.nunito(
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Text(
                'Sign Up',
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
                      return 'Please enter vaild name';
                    }
                    {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    _name = newValue;
                  },
                  controller: new_name_txt,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      prefixIconColor: const Color.fromRGBO(40, 140, 255, 10),
                      labelText: 'Name',
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
                  controller: new_email_txt,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter vaild email';
                    }
                    if (!isEmail(value)) {
                      return 'Please enter vaild email';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _email = newValue!;
                  },
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
                  controller: new_password_txt,
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
              SizedBox(
                width: mwidth / 1.2,
                child: DropDown_Btn(),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        selecteditem == 'Provider') {
                      createAccount();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) {
                          return const Provider();
                        },
                      ));
                    }
                    {
                      // return;
                    }
                    {
                      if (formKey.currentState!.validate() &&
                          selecteditem == 'Client') {
                        createAccount();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const Home();
                          },
                        ));
                      }
                    }
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStatePropertyAll(GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                    overlayColor: MaterialStatePropertyAll(
                        isEmailCorrect == false ? Colors.red : Colors.green),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(40, 140, 255, 10)),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 50, vertical: 0)),
                  ),
                  icon: const Icon(Icons.login),
                  label: const Text('Sign Up')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already have account?',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const Login();
                          },
                        ));
                      },
                      child: Text(
                        'SignIn',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '________ Or ________',
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await signinwithgoogle();
                          if (selecteditem == 'Client') {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return const Home();
                              },
                            ));
                          }
                          if (selecteditem == 'Provider') {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return const Provider();
                              },
                            ));
                          }
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

  DropdownButtonFormField<String> DropDown_Btn() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_box),
          prefixIconColor: const Color.fromRGBO(40, 140, 255, 10),
          labelText: 'AccountType',
          hintText: '',
          hintStyle: GoogleFonts.nunito(
            color: const Color.fromRGBO(40, 140, 255, 2),
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.all(7.5),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.5)),
          )),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: (item) => setState(() {
        selecteditem = item;
      }),
      value: selecteditem,
    );
  }
}
