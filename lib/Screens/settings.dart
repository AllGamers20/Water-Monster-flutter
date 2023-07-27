import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_monster/Screens/home.dart';
import 'package:water_monster/Screens/qr.dart';
// import 'package:water_monster/Screens/qr.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double val = 20;

  @override
  Widget build(BuildContext context) {
    final oheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(40, 140, 255, 10),
          foregroundColor: Colors.white,
          title: Text(
            'Container Settings',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                //*FirstContainer
                Container(
                    width: mwidth / 1.2,
                    height: 480,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(
                            4.0,
                            4.0,
                          ),
                        ),
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(
                            -4.0,
                            -4.0,
                          ),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Information',
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              widthFactor: mwidth / 2500,
                              child: SizedBox(
                                width: mwidth / 1.5,
                                child: TextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      labelText: 'Container Name',
                                      hintText: '',
                                      hintStyle: GoogleFonts.nunito(
                                        color: const Color.fromRGBO(
                                            40, 140, 255, 2),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      contentPadding: const EdgeInsets.all(7.5),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.5)),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              widthFactor: mwidth / 2500,
                              child: SizedBox(
                                width: mwidth / 1.5,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'Size(Liters)',
                                      hintText: '',
                                      hintStyle: GoogleFonts.nunito(
                                        color: const Color.fromRGBO(
                                            40, 140, 255, 2),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      contentPadding: const EdgeInsets.all(7.5),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.5)),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              widthFactor: mwidth / 1400,
                              child: SizedBox(
                                width: mwidth / 1.5,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'Height(Cm)',
                                      hintText: '',
                                      hintStyle: GoogleFonts.nunito(
                                        color: const Color.fromRGBO(
                                            40, 140, 255, 2),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      contentPadding: const EdgeInsets.all(7.5),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.5)),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Center(
                                      widthFactor: mwidth / 2000,
                                      child: Text(
                                        'Level Alert($val%)',
                                        style: GoogleFonts.nunito(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Center(
                              widthFactor: mwidth / 2000,
                              child: Slider(
                                value: val,
                                min: 0,
                                max: 100,
                                label: val.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    val = value.toDouble().truncateToDouble();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              widthFactor: 0.5,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.floppyDisk),
                                label: const Text('Save'),
                                style: ButtonStyle(
                                  textStyle: MaterialStatePropertyAll(
                                      GoogleFonts.nunito(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.grey),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color.fromRGBO(40, 140, 255, 10)),
                                  foregroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white),
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 0)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Scan the QR code to connect other device',
                  style: GoogleFonts.nunito(
                    color: Colors.grey,
                  ),
                ),
                const QRCODE(value: 'Hello World', width: 200)
              ])),
        ));
  }
}
