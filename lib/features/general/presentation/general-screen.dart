import 'package:flutter/material.dart';

import 'body-general.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: BodyGeneral()),
    );
  }
}
