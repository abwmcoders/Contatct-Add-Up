import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';



void main() {
  runApp(const ApiLocal());
}

class ApiLocal extends StatelessWidget {
  const ApiLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Learning FastApi',
      home: Home(),);
  }
}




// class FinTechExplainedProfilesWidget extends StatefulWidget {
//   const FinTechExplainedProfilesWidget({super.key});

//   @override
//   State<FinTechExplainedProfilesWidget> createState() =>
//       _FinTechExplainedProfilesWidgetState();
// }

// class _FinTechExplainedProfilesWidgetState
//     extends State<FinTechExplainedProfilesWidget> {
//   @override
//   final _biggerFont = const TextStyle(fontSize: 18);

//   late Future futureProfiles;


  

  

//   @override
//   void initState() {
//     super.initState();
//     futureProfiles = getProfiles();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Expanded(
//                 child: Column(
//               children: [
//                 TextField(
//                   controller: profile_box,
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Enter Profile',
//                   ),
//                 ),
//                 TextField(
//                   controller: profile_number,
//                   decoration: const InputDecoration(
//                     border: UnderlineInputBorder(),
//                     labelText: 'Enter Profile Number',
//                   ),
//                 ),
//               ],
//             )),
//             Expanded(
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.add,
//                 ),
//                 iconSize: 50,
//                 color: Colors.green,
//                 splashColor: Colors.purple,
//                 onPressed: () => setState(() {
                  
//                 }),
//               ),
//             ),
//           ],
//         ),
//         Expanded(
//             child: FutureBuilder(
//                 future: getProfiles(),
//                 builder: (context, data) {
//                   if (data.data == null) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   } else {
//                     return ListView.builder(
//                         itemCount: data.data?.length,
//                         itemBuilder: (context, index) {
//                           final title = data.data![index].name;
//                           final number = data.data![index].number;
//                           return ListTile(
//                             title: Text(title),
//                             subtitle: Text(number),
//                           );
//                         });
//                   }
//                 })),
//       ],
//     );
//   }
// }
