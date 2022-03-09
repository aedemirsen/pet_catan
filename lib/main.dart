import 'package:flutter/services.dart';
import 'package:pet_catan/pages/filter.dart';
import 'package:pet_catan/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_catan/pages/profile.dart';
import 'package:pet_catan/pages/start_page.dart';

import 'pages/petcatan_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Vertical Orientation is set
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', ''),
        Locale('en', ''),
      ],
      title: 'PET ÇATAN',
      theme: ThemeData(
        fontFamily: 'Arial',
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlue,
      ),
      initialRoute: Start.routeName,
      routes: {
        Start.routeName: (context) => const Start(),
        PetCatanHomePage.routeName: (context) => const PetCatanHomePage(),
        NotificationPage.routeName: (context) => const NotificationPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        FilterScreen.routeName: (context) => const FilterScreen(),
      },
      //home: const MyApp(),
    ),
  );
}
