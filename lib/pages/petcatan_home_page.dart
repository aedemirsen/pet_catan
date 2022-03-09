import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_catan/other/page_router.dart';
import 'package:pet_catan/pages/filter.dart';
import 'package:pet_catan/pages/notification_page.dart';
import 'package:pet_catan/pages/profile.dart';
import '../config/app_config.dart' as conf;
import '../config/app_config.dart';
import '../other/start_info.dart';

class PetCatanHomePage extends StatefulWidget {
  const PetCatanHomePage({Key? key}) : super(key: key);

  static const routeName = '/petcatanhome';

  @override
  State<PetCatanHomePage> createState() => _PetCatanHomePageState();
}

class _PetCatanHomePageState extends State<PetCatanHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: conf.appBarHeight,
          child: Row(
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const CircleAvatar(
                      radius: conf.avatarRadius,
                      backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ProfilePage.routeName);
                    },
                  ),
                ),
              ),
              const Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('PetÇatan'),
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const ImageIcon(conf.notificationIcon),
                    onPressed: () {
                      Navigator.pushNamed(context, NotificationPage.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const CustomAppBar(),
        ],
        body: const GridViewer(),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: SizedBox(
        height: conf.searchBoxHeight,
        //width: AppConfig.screenWidth,
        child: Row(
          children: [
            Flexible(
              flex: 8,
              child: CupertinoSearchTextField(
                onChanged: (text) {},
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixInsets: const EdgeInsets.only(left: 15),
                suffixInsets: const EdgeInsets.only(right: 15),
                itemColor: CupertinoColors.black.withOpacity(0.7),
                placeholder: AppLocalizations.of(context)!.search,
                placeholderStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                  letterSpacing: 1,
                  fontSize: 15,
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: IconButton(
                    icon: conf.filterIcon,
                    onPressed: () {
                      PageRouter.pageRouter.changePageWithAnimation(context,
                          const FilterScreen(), PageRouter.pageRouter.upToDown);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewer extends StatefulWidget {
  const GridViewer({Key? key}) : super(key: key);

  @override
  State<GridViewer> createState() => _GridViewerState();
}

class _GridViewerState extends State<GridViewer> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(conf.gridViewInset),
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 1,
      children: [
        Card(
          color: Colors.white30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/kuymo.jpeg',
                fit: BoxFit.fill,
              ),
              //like icon
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: conf.likeIcon,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          color: Colors.white30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            'assets/images/1.jpeg',
            fit: BoxFit.fill,
          ),
        ),
        Card(
          color: Colors.white30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            'assets/images/2.jpeg',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
