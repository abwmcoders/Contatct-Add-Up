import 'package:fast_api/home.dart';
import 'package:flutter/material.dart';

import 'services.dart';

Future<void> showAlertDialog(context, TextEditingController profileBox, TextEditingController profileNumber) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text('Create profile'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: profileBox,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter Profile',
                ),
              ),
              TextField(
                controller: profileNumber,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter Profile Number',
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              ApiService().createProfile(profileBox.text, profileNumber.text);
              profileBox.clear();
              profileNumber.clear();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Home()),
              // ModalRoute.withName('/')
               (Route<dynamic> route) => false);
            },
          ),
        ],
      );
    },
  );
}
