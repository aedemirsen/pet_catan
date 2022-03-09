import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/app_config.dart' as conf;

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const routeName = '/filter';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: conf.filterScreenBackgroundColor,
      body: Center(
        child: Container(
          width: conf.filterScreenWidth,
          height: conf.filterScreenHeight,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  //back icon
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(3, 3, 0, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.white,
                            size: 40,
                          ),
                          splashRadius: 23,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                  //header
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.filter,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
