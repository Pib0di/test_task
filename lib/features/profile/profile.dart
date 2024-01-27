import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_task/features/profile/widgets/account.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final screens = const [
    Center(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.window),
            label: 'Мои проекты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Мой аккаунт',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return screens[index];
          },
        );
      },
    );
  }
}
