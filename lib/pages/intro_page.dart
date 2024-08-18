import 'package:flutter/material.dart';
import 'package:sushi_restoran_ui/component/button.dart';

class IntoPage extends StatelessWidget {
  const IntoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 48, 39),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // judul
            SizedBox(
              height: 10,
            ),
            Text(
              "SUSHI GHIFARI",
              style: TextStyle(fontSize: 29, color: Colors.white),
            ),
            //icon
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("images/sushi1.png"),
            ),
            SizedBox(
              height: 10,
            ),
            // title
            Text(
              "Cita Rasa Makanan Jepang",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),

            // sub title
            SizedBox(
              height: 10,
            ),
            Text(
              "Nasi sushi mempunyai rasa masam yang lembut karena dibumbui campuran cuka beras, garam, dan gula. ",
              style: TextStyle(fontSize: 12, height: 2, color: Colors.white),
            ),
            // get statet button
            SizedBox(
              height: 10,
            ),
            MyButton(
              text: "Get Started",
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            )
          ],
        ),
      ),
    );
  }
}
