import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:login_with_signup/Screens/Appointment.dart';

import 'package:login_with_signup/Screens/Dropdown_button.dart';

import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:login_with_signup/main.dart';
import 'package:login_with_signup/utils/routes_name.dart';

import 'package:splashscreen/splashscreen.dart';

import '../Model/User.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  void initState() {
    super.initState();
    listUsers = fetchUsers();
  }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      var getUsersData = json.decode(response.body) as List;
      var listUsers = getUsersData.map((i) => User.fromJSON(i)).toList();
      return listUsers;
    } else {
      throw Exception('No Records Found');
    }
  }

  int selectedValue = 1;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.green,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  DecoratedBox(decoration: BoxDecoration(), child: DropDown()),
            ),
          ],
        ),
        leading: IconButton(
          icon: MyApp.themeNotifier.value == ThemeMode.dark
              ? Image.asset(
                  "assets/images/123.png",
                  color: Colors.white,
                )
              : Image.asset(
                  "assets/images/123.png",
                ),
          onPressed: () {
            Navigator.pushNamed(context, RouteName.HomePage);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.power_settings_new_rounded,
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
                  RouteName.LoginForm, (Route<dynamic> route) => false),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: listUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      var user = (snapshot.data as List<User>)[index];
                      return Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.Appointment);
                          },
                          child: ListTile(
                            title: Text(
                              user.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.phone,
                                ),
                                Text(user.email),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: user.phone.startsWith("1") ||
                                          user.phone.startsWith("0")
                                      ? Icon(
                                          Icons.woman_outlined,
                                          color: Colors.orange,
                                        )
                                      : Icon(
                                          Icons.man,
                                          color: Colors.black,
                                        ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: IconButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, RouteName.Capture_images);
                                      },
                                      icon: Icon(Icons.camera_alt_outlined)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: (snapshot.data).length),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else {
            return SplashScreen(
                navigateAfterSeconds: UploadImageScreen(),
                seconds: 5,
                useLoader: true,
                loaderColor: Colors.green);
          }
        },
      ),
    );
  }
}
