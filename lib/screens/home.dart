import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/controller/user_notifier.dart';
import 'package:providerapp/models/user.dart';
import 'package:providerapp/screens/user_list_Screen.dart';
import 'package:providerapp/widget/kiran_button.dart';
import 'package:providerapp/widget/kiran_input.dart';
import 'package:providerapp/widget/user_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _name;
  late String _city;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Provider Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              KiranInput(
                labelText: 'Name',
                onSaved: (String? value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 16),
              KiranInput(
                labelText: 'City',
                onSaved: (String? value) {
                  _city = value!;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KiranButton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;

                      _formKey.currentState!.save();

                      userNotifier.addUser(User(_name, _city));
                    },
                    color: Color(0xFFA11111),
                  ),
                  SizedBox(width: 8),
                  KiranButton(
                    text: 'List',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListScreen(),
                        ),
                      );
                    },
                    color: Color(0xFFA11111),
                  ),
                ],
              ),
              SizedBox(height: 20),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}
