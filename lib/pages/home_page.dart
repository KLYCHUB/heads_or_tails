import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../product/color/color_items.dart';
import '../product/lang/langue_item.dart';
import '../product/utils/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _countValue_1 = 0;
  int _countValue_2 = 0;

  void _counterUpdate(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        _countValue_1 += 1;
      });
    } else {
      setState(() {
        _countValue_1 -= 1;
      });
      if (_countValue_1 < 0) {
        _countValue_1 = 0;
      }
    }
  }

  void _counterUpdate_2(bool isIncrement) {
    if (isIncrement) {
      setState(() {
        _countValue_2 += 1;
      });
    } else {
      setState(() {
        _countValue_2 -= 1;
      });
      if (_countValue_2 < 0) {
        _countValue_2 = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor().bg,
      appBar: AppBar(
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.circleInfo,
            size: ProjectNumbers().appBarActionsIcons,
          ),
          onPressed: () async {
            final websiteUrl =
                Uri.parse('https://www.instagram.com/yelbegensoftware/');
            if (await canLaunchUrl(websiteUrl)) {
              launchUrl(websiteUrl);
            } else {
              if (kDebugMode) {
                print("can't lahunch $websiteUrl");
              }
            }
          },
        ),
        actions: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.googlePlay,
              size: ProjectNumbers().appBarActionsIcons,
            ),
            onPressed: () async {
              final websiteUrl =
                  Uri.parse('https://www.instagram.com/yelbegensoftware/');
              if (await canLaunchUrl(websiteUrl)) {
                launchUrl(websiteUrl);
              } else {
                if (kDebugMode) {
                  print("can't lahunch $websiteUrl");
                }
              }
            },
          ),
        ],
        centerTitle: true,
        title: _appBarTitle(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const FlipCard(
            fill: Fill.fillBack,
            direction: FlipDirection.HORIZONTAL,
            side: CardSide.FRONT,
            front: Image(image: AssetImage("assets/image/tura.jpeg")),
            back: Image(image: AssetImage("assets/image/yazi.jpeg")),
            autoFlipDuration: Duration(seconds: 1),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [_leftCounter(), _rightCounter()],
          ),
          Center(
            child: Padding(
              padding: ProjectPadding().buttonSymetirc,
              child: Container(
                decoration: _boxDecoration(),
                child: _headOrTail(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //----------------------------------------------------------------------------

  Text _appBarTitle(BuildContext context) {
    return Text(
      ProjectTexts().appBarTitle,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: ProjectNumbers().headsTailsLetterSpacing,
          color: ProjectColor().whiteARGB),
    );
  }

  Row _rightCounter() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            _counterUpdate_2(false);
          },
          child: _CounterUpdateContainer(ProjectTexts().minus),
        ),
        _counterText_2(),
        InkWell(
          onTap: () {
            _counterUpdate_2(true);
          },
          child: _CounterUpdateContainer(
            ProjectTexts().plus,
          ),
        ),
      ],
    );
  }

  Row _leftCounter() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            _counterUpdate(false);
          },
          child: _CounterUpdateContainer(ProjectTexts().minus),
        ),
        _counterText(),
        InkWell(
          onTap: () {
            _counterUpdate(true);
          },
          child: _CounterUpdateContainer(
            ProjectTexts().plus,
          ),
        ),
      ],
    );
  }

  Padding _counterText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        _countValue_1.toString(),
        style: TextStyle(
          color: ProjectColor().headsTailsColor,
          fontSize: ProjectNumbers().appBarActionsIcons,
        ),
      ),
    );
  }

  Padding _counterText_2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        _countValue_2.toString(),
        style: TextStyle(
          color: ProjectColor().headsTailsColor,
          fontSize: ProjectNumbers().appBarActionsIcons,
        ),
      ),
    );
  }

  ElevatedButton _headOrTail(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (RandomInt().rastgeleSayi == 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) => _AlertDialogHeadsTails(
              textUp: ProjectTexts().heads,
              imageAssets: ProjectAssets().heads,
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) => _AlertDialogHeadsTails(
              textUp: ProjectTexts().tails,
              imageAssets: ProjectAssets().tails,
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ProjectColor().elevatedButton,
        shadowColor: ProjectColor().elevatedButton,
      ),
      child: Padding(
        padding: ProjectPadding().headsTailseAssetsSymmetric,
        child: Text(
          ProjectTexts().headsOrTails,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: ProjectCircular().circular20,
      gradient: LinearGradient(
        colors: [ProjectColor().greyARGB, ProjectColor().whiteARGB],
      ),
    );
  }
}

//------------------------------------------------------------------------------

class RandomInt {
  int rastgeleSayi = Random().nextInt(2);
}

class _CounterUpdateContainer extends StatelessWidget {
  const _CounterUpdateContainer(this.minusPlus);

  final String minusPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ProjectNumbers().counterSize,
      width: ProjectNumbers().counterSize,
      decoration: BoxDecoration(
        borderRadius: ProjectCircular().circular5,
        gradient: LinearGradient(
          colors: [
            ProjectColor().greyARGB,
            ProjectColor().whiteARGB,
          ],
        ),
      ),
      child: RepaintBoundary(
        child: Text(
          minusPlus,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ProjectColor().draweBG,
            fontSize: ProjectNumbers().conterTextSize,
          ),
        ),
      ),
    );
  }
}

class _AlertDialogHeadsTails extends StatelessWidget {
  const _AlertDialogHeadsTails({
    required this.textUp,
    required this.imageAssets,
  });

  final String textUp;
  final String imageAssets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding().showDiaologSymetric,
      child: AlertDialog(
        backgroundColor: ProjectColor().showDialogBg,
        alignment: Alignment.topCenter,
        title: Text(textUp, textAlign: TextAlign.center),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: ProjectColor().headsTailsColor,
              letterSpacing: ProjectNumbers().headsTailsLetterSpacing,
            ),
        content: Padding(
          padding: ProjectPadding().headsTailseAssetsSymmetric2X,
          child: Image.asset(
            imageAssets,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
