import 'package:flutter/material.dart';
import 'package:to_do_list/pages/home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[500],
        body: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(children: [
            Expanded(
              flex: 6,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text('Quản lý Công Việc',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontFamily: 'RussoOne')),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Nhóm 12',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'RussoOne'),
                        )),
                  ]),
            ),
            Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              MaterialButton(
                  padding: const EdgeInsets.all(8.0),
                  elevation: 0,
                  color: Colors.white,
                  // shape: const CircleBorder(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HomePage())));
                  },
                  child: const Text(
                    "Tiếp tục",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  )
                  // const Icon(
                  //   Icons.arrow_forward_ios_outlined,
                  //   color: Colors.blue,
                  //   size: 30,
                  // ),
                  ),
            ]))
          ]),
        ),
      ),
    );
  }
}
