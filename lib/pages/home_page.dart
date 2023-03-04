import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../product/color/color_items.dart';
import '../product/counter.dart';
import '../product/lang/langue_item.dart';
import '../product/utils/constants.dart';
import '../product/flip_card.dart';
import '../product/win_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColor().bg,
      appBar: _appBar(context),
      body: Column(
        children: const [
          Spacer(),
          FlipCoin(),
          Spacer(),
          CustomCounter(),
          CustomShowDialog(),
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

  //update
  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: FaIcon(
          FontAwesomeIcons.circleInfo,
          size: ProjectNumbers().appBarActionsIcons,
        ),
        onPressed: () async {
          final websiteUrl =
              Uri.parse('https://www.instagram.com/yelbegensoftware/'); //update
          if (await canLaunchUrl(websiteUrl)) {
            launchUrl(websiteUrl);
          } else {
            if (kDebugMode) {
              print("can't lahunch $websiteUrl"); //update
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
            final websiteUrl = Uri.parse(
                'https://www.instagram.com/yelbegensoftware/'); //update
            if (await canLaunchUrl(websiteUrl)) {
              launchUrl(websiteUrl);
            } else {
              if (kDebugMode) {
                print("can't lahunch $websiteUrl"); //update
              }
            }
          },
        ),
      ],
      centerTitle: true,
      title: _appBarTitle(context),
    );
  }
}
