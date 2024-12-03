import 'package:flutter/material.dart';
import 'package:flutter_ds_demo/custom/BorderBox.dart';
import 'package:flutter_ds_demo/custom/OptionButton.dart';
import 'package:flutter_ds_demo/utils/constants.dart';
import 'package:flutter_ds_demo/utils/custom_functions.dart';
import 'package:flutter_ds_demo/utils/widget_functions.dart';

class DetailPage extends StatelessWidget {
  final dynamic itemData;

  const DetailPage({required Key key, @required this.itemData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(itemData["image"]),
                        Positioned(
                          width: size.width,
                          top: padding,
                          child: Padding(
                            padding: sidePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: BorderBox(
                                    height: 50,
                                    width: 50,
                                    key: UniqueKey(),
                                    padding: EdgeInsets.all(0),
                                    child: Icon(
                                      Icons.keyboard_backspace,
                                      color: COLOR_BLACK,
                                    ),
                                  ),
                                ),
                                BorderBox(
                                  height: 50,
                                  width: 50,
                                  key: UniqueKey(),
                                  padding: EdgeInsets.all(0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: COLOR_BLACK,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${formatCurrency(itemData["amount"])}",
                                style: themeData.textTheme.displayLarge,
                              ),
                              addVerticalSpace(5),
                              Text(
                                "\$${itemData["address"]}",
                                style: themeData.textTheme.titleSmall,
                              ),
                            ],
                          ),
                          BorderBox(
                            child: Text(
                              "20 Hours ago",
                              style: themeData.textTheme.headlineSmall,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            key: UniqueKey(),
                            width: 0,
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "House Information",
                        style: themeData.textTheme.headlineMedium,
                      ),
                    ),
                    addVerticalSpace(padding),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          InformationTile(
                              content: "${itemData["area"]}",
                              name: "Square Foot",
                              key: UniqueKey()),
                          InformationTile(
                              content: "${itemData["bedrooms"]}",
                              name: "Bedrooms",
                              key: UniqueKey()),
                          InformationTile(
                              content: "${itemData["bathrooms"]}",
                              name: "Bathrooms",
                              key: UniqueKey()),
                          InformationTile(
                              content: "${itemData["garage"]}",
                              name: "Garage",
                              key: UniqueKey()),
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        itemData["description"],
                        textAlign: TextAlign.justify,
                        style: themeData.textTheme.bodyMedium,
                      ),
                    ),
                    addVerticalSpace(100),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionButton(
                      text: "Message",
                      icon: Icons.message,
                      width: size.width * 0.35,
                      key: UniqueKey(),
                    ),
                    addHorizontalSpace(10),
                    OptionButton(
                      text: "Call",
                      icon: Icons.call,
                      width: size.width * 0.35,
                      key: UniqueKey(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget {
  final String content;
  final String name;

  const InformationTile(
      {required Key key, required this.content, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width * 0.20;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderBox(
              width: tileSize,
              height: tileSize,
              key: UniqueKey(),
              padding: EdgeInsets.all(0),
              child: Text(
                content,
                style: themeData.textTheme.displaySmall,
              )),
          addVerticalSpace(15),
          Text(
            name,
            style: themeData.textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
