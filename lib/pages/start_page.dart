import 'package:flutter/material.dart';
import 'package:pet_catan/pages/advert.dart';
import 'package:pet_catan/pages/chat_page.dart';

import '../config/app_config.dart';
import '../config/app_config.dart' as conf;
import '../other/start_info.dart';
import '../util/util_ops.dart';
import 'petcatan_home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  late int _currentIndex;
  late bool _startInfoVisible;
  late double _optionBoxVerticalPosition;
  late bool _optionBoxVisible;

  //floating action button
  late GlobalKey _fabKey;

  final _screens = [
    const PetCatanHomePage(),
    const AdvertPage(),
    const ChatPage(),
  ];

  @override
  void initState() {
    _fabKey = GlobalKey();
    _currentIndex = 0;
    _startInfoVisible = false;
    _optionBoxVisible = false;
    _optionBoxVerticalPosition = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //set screen height and width if they already set.
    if (AppConfig.screenWidth == 0) {
      AppConfig.screenWidth = MediaQuery.of(context).size.width;
    }
    if (AppConfig.screenHeight == 0) {
      AppConfig.screenHeight = MediaQuery.of(context).size.height;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          _screens[_currentIndex],
          Visibility(
            visible: _startInfoVisible,
            child: StartInfo(),
          ),
          Visibility(
            visible: _optionBoxVisible,
            child: Positioned(
              //get position of floating action button and use y axis length
              top: _optionBoxVerticalPosition,
              left: conf.optionsBoxLeftInset,
              child: AppConfig.screenWidth < conf.optionsBoxWidth
                  ? const OptionsBoxVertical()
                  : const OptionsBox(),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: conf.navBarHeight,
        child: FittedBox(
          child: FloatingActionButton(
            key: _fabKey,
            onPressed: () {
              setState(() {
                _optionBoxVerticalPosition =
                    AppConfig.screenWidth < conf.optionsBoxWidth
                        ? Util.getPosition(_fabKey).last -
                            conf.optionsBoxHeight * 3 -
                            15
                        : Util.getPosition(_fabKey).last -
                            conf.optionsBoxHeight -
                            5;
                _optionBoxVisible = !_optionBoxVisible;
              });
            },
            child: const ImageIcon(conf.actionButtonIcon),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: conf.notchMargin,
        shape: const CircularNotchedRectangle(),
        child: _bottomAppBar(),
      ),
    );
  }

  _bottomAppBar() {
    return SizedBox(
      height: conf.navBarHeight,
      child: Row(
        children: [
          SizedBox(
            width: conf.navBarLeftRightWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    //home page
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                          _optionBoxVisible = false;
                        });
                      },
                      icon: ImageIcon(
                        conf.homeIcon,
                        color: _currentIndex == 0
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                        size: 30,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.home,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: _currentIndex == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: _currentIndex == 0
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: (() => setState(() => _currentIndex = 1)),
                //   icon: const ImageIcon(
                //     conf.notificationIcon,
                //     size: 30,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: conf.navBarHeight,
            ),
            child: SizedBox(
              width: conf.navBarLeftRightWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 1;
                            _optionBoxVisible = false;
                          });
                        },
                        icon: ImageIcon(
                          conf.noticeIcon,
                          color: _currentIndex == 1
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                          size: 30,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.advert,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: _currentIndex == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _currentIndex == 1
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _currentIndex = 2;
                            _optionBoxVisible = false;
                          });
                        },
                        icon: ImageIcon(
                          conf.chatIcon,
                          color: _currentIndex == 2
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                          size: 30,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.chat,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: _currentIndex == 2
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _currentIndex == 2
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsBox extends StatelessWidget {
  const OptionsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, Color> _options = {
      AppLocalizations.of(context)!.petcatan: conf.petCatanColor,
      AppLocalizations.of(context)!.adopt: conf.petSahiplenColor,
      AppLocalizations.of(context)!.market: conf.petMarketColor,
    };
    return SizedBox(
      width: conf.optionsBoxWidth,
      height: conf.optionsBoxHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _options.entries.map((e) {
          return SizedBox(
            width: conf.optionBoxWidth,
            child: ElevatedButton(
              child: Center(
                child: Text(e.key),
              ),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(e.value),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class OptionsBoxVertical extends StatelessWidget {
  const OptionsBoxVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, Color> _options = {
      AppLocalizations.of(context)!.petcatan: conf.petCatanColor,
      AppLocalizations.of(context)!.adopt: conf.petSahiplenColor,
      AppLocalizations.of(context)!.market: conf.petMarketColor,
    };
    return SizedBox(
      width: conf.optionsBoxWidth,
      height: conf.optionsBoxHeight * 3 + 15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _options.entries.map((e) {
          return SizedBox(
            width: conf.optionBoxWidth,
            height: conf.optionsBoxHeight,
            child: ElevatedButton(
              child: Center(
                child: Text(e.key),
              ),
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(e.value),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
