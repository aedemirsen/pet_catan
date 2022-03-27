import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConfig {
  static double screenWidth = 0, screenHeight = 0;
}

//Start Info
final double startInfoWidth = AppConfig.screenWidth * 0.75;
final double startInfoHeight = AppConfig.screenHeight * 0.3;
final double startInfoHeaderWidth = startInfoWidth * 0.7;
final double startInfoHeaderHeigth = startInfoHeight * 0.08;
const Color startInfoBackgroundColor = Colors.white;
const Color startInfoBorderColor = Colors.blue;
const Color startInfoTextColor = Colors.red;
const Color infoTextColor = Colors.black;
final double dismissIconSize = startInfoHeight * 0.16;

//PetÇatan Home Page
final double searchBoxWidth = AppConfig.screenWidth * 0.8;
const double searchBoxHeight = 40;
const double avatarRadius = 23;
const double appBarHeight = 50;
const double gridViewInset = 5;
const likeIcon = CupertinoIcons.heart_fill;
const filterIcon = Icon(
  CupertinoIcons.slider_horizontal_3,
);

//Filter Screen
final Color filterScreenBackgroundColor = Colors.transparent.withOpacity(0.6);
final double filterScreenWidth = AppConfig.screenWidth * 0.9;
final double filterScreenHeight = AppConfig.screenHeight * 0.75;
final double filtersHeight =
    filterScreenHeight - filtersHeaderHeight - filterButtonHeight;
const double filtersHeaderHeight = 50;
const double filterButtonHeight = 50;

const Icon filterDownIcon = Icon(
  Icons.arrow_downward,
  color: Colors.blue,
);

//Bottom Navigation Bar
const double navBarHeight = 60;
final double navBarLeftRightWidth = (AppConfig.screenWidth - 60) / 2;
const double notchMargin = 8;
const actionButtonIcon = AssetImage("assets/images/paw.png");
const homeIcon = AssetImage("assets/images/animal-shelter.png");
const notificationIcon = AssetImage("assets/images/ringing.png");
const chatIcon = AssetImage("assets/images/chat.png");
const noticeIcon = AssetImage("assets/images/noticeboard.png");
const labelFontSize = 10;

//Option Box
const double optionsBoxHeight = 50;
const double optionsBoxWidth = 350;
final double optionsBoxLeftInset =
    (AppConfig.screenWidth - optionsBoxWidth) / 2;
const double optionBoxWidth = 110;
const Color petCatanColor = Colors.orange;
const Color petSahiplenColor = Colors.blue;
const Color petMarketColor = Colors.teal;

//Extended Advert Screen
final double swiperHeight = AppConfig.screenHeight * 0.4;
