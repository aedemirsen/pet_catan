import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/app_config.dart' as conf;

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

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
    final List<String> _filters = [
      AppLocalizations.of(context)!.gender,
      AppLocalizations.of(context)!.breed,
      AppLocalizations.of(context)!.age,
      AppLocalizations.of(context)!.neutered,
      AppLocalizations.of(context)!.color,
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: conf.filterScreenBackgroundColor,
      body: Center(
        child: Container(
          width: conf.filterScreenWidth,
          height: conf.filterScreenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              //header
              SizedBox(
                height: conf.filtersHeaderHeight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //back icon
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 3, 0, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.arrow_left,
                            color: Colors.black,
                            size: 40,
                          ),
                          splashRadius: 23,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    //header
                    Text(
                      AppLocalizations.of(context)!.filter,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              //filters
              SizedBox(
                height: conf.filtersHeight,
                child: ListView.builder(
                  itemCount: _filters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(_filters[index]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 15.0,
                              top: 5,
                            ),
                            child: SizedBox(
                              height: 50,
                              width: conf.filterScreenWidth - 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    conf.filterDownIcon,
                                    SizedBox.expand(
                                      child: DropdownButton<String>(
                                        value: _filters.elementAt(index),
                                        //items: [],
                                        items: _filters.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        // icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        icon: const SizedBox.shrink(),
                                        style: const TextStyle(
                                          color: Colors.deepPurple,
                                        ),
                                        underline: const SizedBox.shrink(),
                                        onChanged: (_) {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              //button
              SizedBox(
                height: conf.filterButtonHeight,
                width: conf.filterScreenWidth,
                child: CupertinoButton(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.blue,
                  child: Text(AppLocalizations.of(context)!.filter),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
