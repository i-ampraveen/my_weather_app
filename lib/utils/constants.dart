import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

Text loadingScreenText = Text(
  'Where are you..?',
  style: GoogleFonts.kaushanScript(fontSize: 22.0),
);

Icon locationIcon = const Icon(
  Icons.location_on_rounded,
  size: 58.0,
  color: Colors.green,
);

void handlePermission(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Location Permission'),
          content: const Text('Please open settings to grant location access'),
          actions: <Widget>[
            TextButton(
              child: Text('OK',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
              onPressed: () => openAppSettings(),
            ),
            TextButton(
              child: Text('CANCEL',
                  style: TextStyle(
                      color: Colors.red.shade300,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}

class FindMe extends StatelessWidget {
  final Function whatToDoOnPressed;

  FindMe({required this.whatToDoOnPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => whatToDoOnPressed(),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text(
        'Find Me..!',
        style: TextStyle(fontSize: 22.0),
      ),
    );
  }
}
