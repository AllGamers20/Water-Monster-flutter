import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_monster/Screens/Profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            //*FirstContainer
            Container(
              width: 370,
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
                    widthFactor: 0.6,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
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
                                title: const Text('Soon'),
                              ),
                            );
                          },
                          child: Image.asset(
                            'Assets/png/plumber.png',
                            width: 110,
                            height: 110,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
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
                                title: const Text('Soon'),
                              ),
                            );
                          },
                          child: Image.asset(
                            'Assets/png/provider.png',
                            width: 110,
                            height: 110,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
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
                                title: const Text('Soon'),
                              ),
                            );
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
              height: 40,
            ),
            ElevatedButton.icon(
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
                      title: const Text('Soon'),
                    ),
                  );
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
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 25, vertical: 0)),
                ),
                label: const Text('New Installation'))
          ],
        ),
      ),
    );
  }
}
//!EVERYTHING HAVE ALERT SOON MAKE IT AFTER I BACK AFTER 7DAYS VACATION
