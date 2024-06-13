// ignore_for_file: deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialerButton extends StatelessWidget {
  
  final String phoneNumber;

  DialerButton({required this.phoneNumber});

  void _launchDialer() async {
    final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(telUri.toString())) {
      await launch(telUri.toString());
    } else {
      throw 'Could not launch $telUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchDialer,
      child: Text('Llamar $phoneNumber'),
    );
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Llamar desde Flutter'),
        ),
        body: Center(
          child: DialerButton(phoneNumber: '5613832232'),  // Reemplaza con el número de teléfono deseado.
          
        ),
      ),
    );
  }
}
