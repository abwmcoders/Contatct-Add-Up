import 'package:flutter/material.dart';

import 'dialog.dart';
import 'services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final profile_box = TextEditingController();
  final profile_number = TextEditingController();

  late Future profileList;

  @override
  void initState() {
    profileList = ApiService().getProfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "FastApi Flutter",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: FutureBuilder(
          future: profileList,
          builder: (context, data) {
            if (data.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } 
            else if (data == []){
              return const Center(
                child: Text("Database is empty"),
              );
            }
            else {
              return ListView.builder(
                  itemCount: data.data?.length,
                  itemBuilder: (context, index) {
                    final title = data.data![index].name;
                    final number = data.data![index].number;
                    return ListTile(
                      title: Text(title),
                      subtitle: Text(number),
                    );
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertDialog(context, profile_box, profile_number),
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}
