import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:login_with_signup/Screens/Appointment.dart';
import 'package:login_with_signup/Screens/Capture_images.dart';
import 'package:login_with_signup/Screens/HomePage.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:splashscreen/splashscreen.dart';

import 'User.dart';

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
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Image.asset(
                "assets/images/123.png",
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyHomePage()));
              },
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on, color: Colors.green),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: DropdownButton(
                      alignment: Alignment.center,
                      isDense: true,
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      iconEnabledColor: Colors.green,
                      value: selectedValue,
                      items: [
                        DropdownMenuItem(
                          child: InkWell(
                            child: Text(
                              "Corp",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                            child: Text("CVR-AK-Anchorage",
                                style: TextStyle(fontSize: 13)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UploadImageScreen()));
                            },
                          ),
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                            child: Text("CVR-AK-Fairbanks",
                                style: TextStyle(fontSize: 13)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => UploadImageScreen()));
                            },
                          ),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AL-Dothan",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AL-Fairhope",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AL-Hoover",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AL-Mobile",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 7,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AL-Mantgomery",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 8,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AL-Opelika",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 9,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AL-Trussville",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 10,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AZ-Gilbert",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 11,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AZ-Mesa",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 12,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-AZ-Phoenix",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 13,
                        ),
                        DropdownMenuItem(
                          child: InkWell(
                              child: Text("CVR-DC1-lrving Street",
                                  style: TextStyle(fontSize: 13)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UploadImageScreen()));
                              }),
                          value: 14,
                        ),
                        DropdownMenuItem(
                            child: InkWell(
                                child: Text("Others",
                                    style: TextStyle(fontSize: 13)),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => UploadImageScreen()));
                                }),
                            value: 15),
                      ],
                      onChanged: (value) {
                        setState(() {
                          value = selectedValue;
                        });
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.power_settings_new_rounded,
                      ),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginForm()),
                          (Route<dynamic> route) => false),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        body: FutureBuilder<List<User>>(
          future: listUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 7, 0),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      var user = (snapshot.data as List<User>)[index];
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Appointment()));
                            },
                            title: Text(
                              user.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text(
                              user.phone,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.female_outlined,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => captureImages()));
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 203, 202, 202),
                                    radius: 18,
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 25,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Text(
                      //       user.name,
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold, fontSize: 20),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         Icon(Icons.man_outlined),
                      //         SizedBox(
                      //           width: 3,
                      //         ),
                      //         CircleAvatar(
                      //           maxRadius: 20,
                      //           backgroundColor:
                      //               Color.fromARGB(255, 210, 208, 208),
                      //           child: IconButton(
                      //               onPressed: () {
                      //                 getImage();
                      //                 // uploadImage();
                      //               },
                      //               icon: Icon(Icons.camera_alt_rounded)),
                      //         ),
                      //       ],
                      //     ),
                      //     Text(
                      //       user.phone,
                      //     ),
                      //     Text(user.email
                      //         // " " +
                      //         // user.address.suite +
                      //         // " " +
                      //         // user.address.city +
                      //         // " " +
                      //         // user.address.zipcode
                      //         ),
                      //   ],
                      // ),
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: (snapshot.data).length),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
            return SplashScreen(
                seconds: 5,
                useLoader: true,
                loaderColor: Color.fromARGB(255, 1, 53, 96));
          },
        ),
      ),
    );
  }
}
// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 getImage();
//               },
//               child: Container(
//                 child: image == null
//                     ? Center(
//                         child: TextButton(
//                           child: Text("Pick Image"),
//                         ),
//                       )
//                     : Container(
//                         child: Center(
//                           child: Image.file(
//                             File(image.path).absolute,
//                             height: 100,
//                             width: 100,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//               ),
//             ),
//             SizedBox(
//               height: 150,
//             ),
//             GestureDetector(
//               onTap: () {
//                 uploadImage();
//               },
//               child: Container(
//                 height: 50,
//                 width: 200,
//                 color: Colors.green,
//                 child: Center(child: Text('Upload')),
//               ),
//             )
//           ],
//         ),