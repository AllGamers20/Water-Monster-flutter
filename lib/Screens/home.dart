// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_monster/Screens/Profile.dart';
import 'package:water_monster/Screens/qrsettings.dart';
import 'package:water_monster/Screens/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime dateTime = DateTime(2022, 02, 25, 12, 30);
  @override
  Widget build(BuildContext context) {
    final oheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //* AppBar Main
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const Profile();
                },
              ));
            }, //*navigation to profile
            icon: const Icon(Icons.account_circle),
            style: const ButtonStyle(
                iconColor: MaterialStatePropertyAll(Colors.white),
                iconSize: MaterialStatePropertyAll(40)),
          )
        ],
        elevation: 3,
        backgroundColor: const Color.fromRGBO(40, 140, 255, 10),
        title: SvgPicture.asset(
          'Assets/svg/Logo.svg',
          fit: BoxFit.cover,
          width: 40,
          height: 40,
        ),
        centerTitle: true,
      ),
      //*Body
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
                height: 200,
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
                      'Services',
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      widthFactor: mwidth / 1000,
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              date_time_picker();
                            },
                            child: Image.asset(
                              'Assets/png/plumber.png',
                              width: 110,
                              height: 110,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              date_time_picker();
                            },
                            child: Image.asset(
                              'Assets/png/provider.png',
                              width: 110,
                              height: 110,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              date_time_picker();
                            },
                            child: Image.asset(
                              'Assets/png/cleaner.png',
                              width: 110,
                              height: 110,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //*Second Container
              // Container(
              //   width: mwidth / 1.2,
              //   height: 400,
              //   padding: const EdgeInsets.all(15),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(20),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.shade300,
              //         offset: const Offset(
              //           4.0,
              //           4.0,
              //         ),
              //       ),
              //       BoxShadow(
              //         color: Colors.grey.shade300,
              //         offset: const Offset(
              //           -4.0,
              //           -4.0,
              //         ),
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget>[
              //       const SizedBox(
              //         height: 10,
              //       ),
              //       Text(
              //         'Demo Container',
              //         style: GoogleFonts.nunito(
              //           fontSize: 20,
              //         ),
              //       ),
              //       SizedBox(
              //         width: mwidth / 5,
              //       ),
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           const SizedBox(
              //             height: 10,
              //           ),
              //           IconButton(
              //             onPressed: () {
              //               Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => const Settings(),
              //               ));
              //             },
              //             icon: const Icon(Icons.settings),
              //             iconSize: 30,
              //             color: Colors.grey,
              //           ),
              //         ],
              //       ),
              //       Positioned(
              //         child: Center(
              //           widthFactor: mwidth,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Image.asset(
              //                 'Assets/png/Container2.png',
              //                 height: 250,
              //                 width: 250,
              //               )
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QRSettings(),
                    ));
                  },
                  icon: const Icon(Icons.add),
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
                        EdgeInsets.symmetric(horizontal: 25, vertical: 0)),
                  ),
                  label: const Text('New Installation'))
            ],
          ),
        ),
      ),
    );
  }

  void date_time_picker() async {
    DateTime? newdate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (newdate == null) return;
    TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: dateTime.hour,
          minute: dateTime.minute,
        ));
    if (newTime == null) return;
    final new_Date_Time = DateTime(
      newdate.year,
      newdate.month,
      newdate.day,
      newTime.hour,
      newTime.minute,
    );
    setState(() {
      Fluttertoast.showToast(
          msg:
              "The Date is${new_Date_Time.year}-${new_Date_Time.month}-${new_Date_Time.day} TheTime is${new_Date_Time.hour}:${new_Date_Time.minute}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }
}
