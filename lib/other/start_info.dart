import 'package:pet_catan/config/app_config.dart' as conf;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartInfo extends StatefulWidget {
  StartInfo({Key? key}) : super(key: key);

  @override
  State<StartInfo> createState() => _StartInfoState();
}

class _StartInfoState extends State<StartInfo> {
  late bool _dontShowChecked;

  @override
  void initState() {
    _dontShowChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //info box header
            SizedBox(
              width: conf.startInfoHeaderWidth,
              height: conf.startInfoHeaderHeigth,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  _localization.start_info_header,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: conf.startInfoTextColor,
                  ),
                ),
              ),
            ),
            //info box
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: conf.startInfoWidth,
                height: conf.startInfoHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: conf.startInfoBorderColor,
                  ),
                  color: conf.startInfoBackgroundColor,
                ),
                child: Text(
                  _localization.start_info,
                  style: const TextStyle(
                    color: conf.infoTextColor,
                  ),
                ),
              ),
            ),
            //check box and dismiss button
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _dontShowChecked,
                    onChanged: (val) {
                      setState(() {
                        _dontShowChecked = val!;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Text(_localization.start_info_dontShowAgain),
                    onTap: () => setState(() {
                      _dontShowChecked = !_dontShowChecked;
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: IconButton(
                      splashRadius: conf.dismissIconSize / 1.8,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        CupertinoIcons.xmark_circle,
                        size: conf.dismissIconSize,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
