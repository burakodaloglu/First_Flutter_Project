import 'package:flutter/material.dart';
import 'package:flutter_first_app/text_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(FontAwesomeIcons.locationDot, color: Colors.grey),
      title: const Text(
        TextConstants.appBarTitle,
        style: TextStyle(color: Colors.grey),
      ),
      centerTitle: false,
      actions: [
        _notificationIcon()
      ],
    );
  }

  Padding _notificationIcon() {
    return Padding(
          padding: EdgeInsets.all(12.0),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(FontAwesomeIcons.bell, color: Colors.grey),
              Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: const Text('.'),
              )
            ],
          ),
        );
  }
}
