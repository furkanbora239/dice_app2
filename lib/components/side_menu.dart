import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://doc-hosting.flycricket.io/dice-roller-privacy-policy/297751e0-e537-4bd2-8eef-33213355c340/privacy');

class sideMenu extends StatelessWidget {
  const sideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AboutDialog(
          applicationName: 'Dice Roller',
          applicationVersion: '0.1.1',
          applicationLegalese:
              'We are not collecting or using any data whatsoever. This is simply a dice rolling application with no other purpose.',
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Sometimes it doesn 't work, but if it does, you can check out our privacy policy from the following link.",
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                _launchUrl;
              },
              child: const Text(
                'https://doc-hosting.flycricket.io/dice-roller-privacy-policy/297751e0-e537-4bd2-8eef-33213355c340/privacy',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 8, decoration: TextDecoration.underline),
              ),
            )
          ],
        )
      ],
    ));
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
