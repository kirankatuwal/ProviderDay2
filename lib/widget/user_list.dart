import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/controller/user_notifier.dart';

class UserList extends StatelessWidget {
  UserList();

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    print("User list building ... ");
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<UserNotifier>(
                    builder: (_, notifier, __) => Text(
                      'Name: ${notifier.userlist[index].name}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Consumer<UserNotifier>(
                    builder: (_, notifier, __) => Text(
                      'City: ${notifier.userlist[index].city}',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              Consumer<UserNotifier>(
                builder: (_, notifier, __) => IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => notifier.deleteUser(index),
                ),
              )
            ],
          ),
        ),
      ),
      itemCount: userNotifier.userlist.length,
    );
  }
}
