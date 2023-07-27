import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:water_monster/Screens/qrcode.dart';

class QRSettings extends StatefulWidget {
  const QRSettings({super.key});

  @override
  State<QRSettings> createState() => _QRSettingsState();
}

final List<PageViewModel> pages = [
  PageViewModel(
      title: 'Step1',
      body: 'Plug the Water Monster Hub To Electricity',
      image: Center(
        child: Image.asset(
          'Assets/gif/plugin.gif',
          width: 110,
          height: 110,
        ),
      ),
      decoration: PageDecoration(
          bodyTextStyle: GoogleFonts.nunito(
            fontSize: 15,
          ),
          titleTextStyle: GoogleFonts.nunito(
            fontSize: 30,
          ))),
  PageViewModel(
      title: 'Step2',
      body: 'Plug the Water Monster Hub To Electricity',
      image: Center(
        child: Image.asset(
          'Assets/gif/scan.gif',
          width: 110,
          height: 110,
        ),
      ),
      decoration: PageDecoration(
          bodyTextStyle: GoogleFonts.nunito(
            fontSize: 15,
          ),
          titleTextStyle: GoogleFonts.nunito(
            fontSize: 30,
          ))),
  PageViewModel(
      title: 'Step3',
      body: 'Dont forget camera Access',
      image: Center(
        child: Image.asset(
          'Assets/gif/wifi.gif',
          width: 110,
          height: 110,
        ),
      ),
      decoration: PageDecoration(
          bodyTextStyle: GoogleFonts.nunito(
            fontSize: 15,
          ),
          titleTextStyle: GoogleFonts.nunito(
            fontSize: 30,
          )))
];

class _QRSettingsState extends State<QRSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Qrcode(),
          ));
        },
        done: Text(
          'Done',
          style: GoogleFonts.nunito(
              fontSize: 20, color: const Color.fromRGBO(40, 140, 255, 30)),
        ),
        next: const Icon(FontAwesomeIcons.arrowRight),
        showDoneButton: true,
        showNextButton: true,
        dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            activeColor: Color.fromRGBO(40, 140, 255, 30),
            activeSize: Size(20, 20)),
      ),
    );
  }
}
