import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_catan/models/advert_card.dart';
import '../config/app_config.dart' as conf;

class AdvertPage extends StatefulWidget {
  const AdvertPage({Key? key}) : super(key: key);

  @override
  State<AdvertPage> createState() => _AdvertPageState();
}

class _AdvertPageState extends State<AdvertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.advert,
        ),
      ),
      body: Container(),
    );
  }
}

class ExtendedAdvert extends StatefulWidget {
  ExtendedAdvert({Key? key, required this.advert}) : super(key: key);

  AdCard? advert;

  @override
  State<ExtendedAdvert> createState() => _ExtendedAdvertState();
}

class _ExtendedAdvertState extends State<ExtendedAdvert> {
  late Color _likeIconColor;

  @override
  void initState() {
    _likeIconColor = Colors.white;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            floatHeaderSlivers: false,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                toolbarHeight: conf.swiperHeight,
                snap: true,
                floating: true,
                automaticallyImplyLeading: false,
                centerTitle: true,
                flexibleSpace: Stack(
                  children: [
                    SizedBox.expand(
                      child: _swiper(widget.advert!.imagePaths),
                    ),
                    Positioned(
                      top: 50,
                      left: 15,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black45,
                        ),
                        width: 35,
                        height: 35,
                        child: GestureDetector(
                          child: const Icon(
                            Icons.close_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 15,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          conf.likeIcon,
                          color: _likeIconColor,
                          size: 40,
                        ),
                        onPressed: () {
                          setState(() {
                            final SnackBar snackBar;
                            if (_likeIconColor == Colors.white) {
                              _likeIconColor = Colors.redAccent;
                              snackBar = SnackBar(
                                content: Text(
                                    AppLocalizations.of(context)!.added_fav),
                              );
                            } else {
                              _likeIconColor = Colors.white;
                              snackBar = SnackBar(
                                content: Text(
                                    AppLocalizations.of(context)!.removed_fav),
                              );
                            }
                            // Show SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
            body: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _swiper(List<String>? _images) {
    return Swiper(
      itemCount: _images!.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                _images.elementAt(index),
                fit: BoxFit.cover,
              ),
            ),
            // Positioned(
            //   bottom: MainPageConf.buttonInset * 2 + MainPageConf.buttonHeight,
            //   left: MainPageConf.buttonInset + 5,
            //   child: SizedBox(
            //     width: MainPageConf.buttonWidth * 1.5,
            //     child: Visibility(
            //       visible: _buttonVisible,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             TEST.slides.elementAt(index).location,
            //             style: TextStyle(
            //               fontFamily: AppTheme.fontFamily,
            //               fontSize: 50,
            //               color: Colors.white,
            //             ),
            //           ),
            //           Padding(padding: EdgeInsets.only(top: 10)),
            //           Text(
            //             TEST.slides.elementAt(index).info,
            //             style: TextStyle(
            //               fontFamily: AppTheme.fontFamily,
            //               fontSize: 25,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
      autoplay: true,
      autoplayDelay: 5000,
      pagination: const SwiperPagination(
        margin: EdgeInsets.all(25.0),
        alignment: Alignment.bottomRight,
      ),
    );
  }
}
