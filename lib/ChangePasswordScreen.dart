import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Current Password',
                ),
                obscureText: true, // Şifre gizle
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'New Password',
                ),
                obscureText: true, // Şifre gizle
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                ),
                obscureText: true, // Şifre gizle
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Şifre değiştirme işlemleri
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
