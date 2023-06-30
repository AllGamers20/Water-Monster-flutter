import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*AppBarForProfile
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 3,
        backgroundColor: const Color.fromRGBO(40, 140, 255, 10),
        title: Text(
          'Profile',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10, //!temp number till i make it flexsible
            ),
            const Icon(
              Icons.account_circle,
              color: Color.fromRGBO(40, 140, 255, 10),
              size: 150,
            ),
            const SizedBox(
              height: 10, //!temp number till i make it flexsible
            ),
            Text(
              'Example@gmail.com', //!temporary till i make controllers
              style: GoogleFonts.nunito(
                color: const Color.fromRGBO(40, 144, 255, 10),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10, //!temp number till i make it flexsible
            ),
            SizedBox(
              width: 360, //!temp number till i make it flexsible
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Name',
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
              height: 10, //!temp number till i make it flexsible
            ),
            SizedBox(
              width: 360,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
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
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 100, //!temp number till i make it flexsible
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.support_agent),
                  color: const Color.fromRGBO(40, 144, 255, 10),
                  iconSize: 35,
                ),
                const SizedBox(
                  width: 100, //!temp number till i make it flexsible
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.language),
                  color: const Color.fromRGBO(40, 144, 255, 10),
                  iconSize: 35,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              onPressed: () {}, //!Temp till i make the login and signup form
              style: ButtonStyle(
                textStyle: MaterialStatePropertyAll(GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
                overlayColor: const MaterialStatePropertyAll(Colors.red),
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(40, 140, 255, 10)),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 50, vertical: 0)),
              ),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
