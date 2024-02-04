import 'package:flutter/material.dart';
import 'package:flutter_first_app/asset_constants.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBarWidget(),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(TextConstants.popularPlace),
            TextButton(
                onPressed: () {}, child: const Text(TextConstants.seeAll)),
          ],
        ),
        SizedBox(height: 20),
        _popularPlaceCard(size),
      ]),
    );
  }

  Container _popularPlaceCard(Size size) {
    return Container(
        height: 200,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(AssetPathConstants().popularImage),
                fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),borderRadius: BorderRadius.circular(10)),
            child: const ListTile(
              title: Text(
                'Kawah Ijen',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Row(children: [
                Icon(
                  FontAwesomeIcons.locationDot,
                  size: 15,
                  color: Colors.white,
                ),
                Text(
                  "Konum Detay",
                  style: TextStyle(color: Colors.white),
                )
              ]),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Text(
                    "4.7",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
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
      actions: [_notificationIcon()],
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
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: const Text('.'),
          )
        ],
      ),
    );
  }
}
