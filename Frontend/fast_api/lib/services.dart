import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constants.dart';
import 'models.dart';


class ApiService{
  void createProfile(String name, String number) async {
    print("{ 'name': $name, 'number': $number,}");
    await http.post(
      Uri.parse('${url}profile'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        "number": number,
      }),
    );
  }

  Future<List<Profile>> getProfiles() async {
    List<Profile> profiles = [];
    var response = await http.get(Uri.parse('${url}profiles'),
        headers: {"Accept": "application/json"});
    var responseData = json.decode(response.body);
    print("Response get from fast API ---------> $responseData");
    for (var profileData in responseData) {
      profiles.add(Profile.fromJson(profileData));
    }

    return profiles;
  }
}