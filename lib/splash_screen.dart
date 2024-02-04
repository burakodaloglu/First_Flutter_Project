import 'package:flutter/material.dart';
import 'package:flutter_first_app/asset_constants.dart';
import 'package:flutter_first_app/bottom_nav_bar.dart';
import 'package:flutter_first_app/text_constants.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _imageBackground(size),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _skipButton(),
                      const SizedBox(height: 20),
                      _textTitle(),
                      _subTitle(size),
                    ],
                  ),
                ),
                _whiteBackground(size, context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Image _imageBackground(Size size) {
    return Image.asset(AssetPathConstants().loginAssetPath,
        height: size.height, width: size.width, fit: BoxFit.cover);
  }

  Text _textTitle() {
    return Text(
      TextConstants().splashTitleText,
      style: const TextStyle(color: Colors.white, fontSize: 60),
    );
  }

  Container _subTitle(Size size) {
    return Container(
      constraints: BoxConstraints(maxWidth: size.width * 0.6),
      child: const Text(
        TextConstants.splashSubtitle,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Expanded _whiteBackground(Size size, BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: size.width,
          height: size.height * .25,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(children: [
            const SizedBox(height: 20),
            _cardLetGetStarted(size, context),
            _alreadyText(),
          ]),
        ),
      ),
    );
  }

  Widget _cardLetGetStarted(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const BottomNavBarWidget()),
            (route) => false);
      },
      child: Card(
        elevation: 15,
        color: Colors.grey,
        child: SizedBox(
          height: 60,
          width: size.width * 0.8,
          child: Center(
            child: Wrap(spacing: 10, children: [
              Text(TextConstants.letsStarted,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
              Icon(Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.onPrimary)
            ]),
          ),
        ),
      ),
    );
  }

  Row _alreadyText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [const Text(TextConstants.alreadyHave), _loginButton()],
    );
  }

  TextButton _loginButton() {
    return TextButton(onPressed: () {}, child: const Text(TextConstants.login));
  }

  Align _skipButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          TextConstants().skipTextButton,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
