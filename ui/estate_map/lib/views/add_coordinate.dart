import 'package:flutter/material.dart';
import 'package:estate_map/views/show_map.dart';
import 'package:latlong/latlong.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final userName = TextEditingController();
  final password = TextEditingController();
  String textDisplay;
  void onSubmit() {
    setState(() {
      print(userName.text);
      if (userName.text.length == 0) {
        textDisplay = "Invalid Username";
      } else if (password.text.length == 0 && userName.text.length > 0) {
        textDisplay = "Invalid Password";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Estate'),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(
                          controller: userName,
                          decoration: InputDecoration(
                            labelText: "X coordinate",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onSubmitted: (_) => onSubmit(),
                        ),
                        TextField(
                          controller: password,
                          decoration: InputDecoration(
                            labelText: "Y coordinate",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onSubmitted: (_) => onSubmit(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            latLngList.add(LatLng(double.parse(userName.text),
                                double.parse(password.text)));
                            print(
                                "${double.parse(userName.text)}  ${double.parse(password.text)} ${latLngList.length}");
                            setState(() {});
                          },
                          child: Text(
                            "Add",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
