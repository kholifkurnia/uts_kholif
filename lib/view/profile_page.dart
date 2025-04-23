import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Column,
        MainAxisAlignment,
        ModalRoute,
        Scaffold,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Halo, $username!')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: $username', style: TextStyle(fontSize: 20)),
            Text('Status: Logged In', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
