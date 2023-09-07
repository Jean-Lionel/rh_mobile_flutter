import 'package:flutter/material.dart';
import 'package:rh_presence_mobile/providers/presenceProvider.dart';

class PresenceScreen extends StatelessWidget {
  const PresenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PresenceProvider.getListePresence();
    return Container();
  }
}
