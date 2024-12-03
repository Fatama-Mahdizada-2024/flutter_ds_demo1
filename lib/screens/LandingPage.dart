import 'package:flutter/material.dart';
import 'package:flutter_ds_demo/custom/BorderBox.dart';
import 'package:flutter_ds_demo/custom/OptionButton.dart';
import 'package:flutter_ds_demo/sample_data.dart';
import 'package:flutter_ds_demo/screens/DetailPage.dart';
import 'package:flutter_ds_demo/utils/constants.dart';
import 'package:flutter_ds_demo/utils/custom_functions.dart';
import 'package:flutter_ds_demo/utils/widget_functions.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        ),
                        key: UniqueKey(),
                        padding: EdgeInsets.all(0),
                      ),
                      BorderBox(
                        height: 50,
                        width: 50,
                        key: UniqueKey(),
                        padding: EdgeInsets.all(0),
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(20),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "City",
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
                addVerticalSpace(10),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "San Francisco",
                    style: themeData.textTheme.displayLarge,
                  ),
                ),
                Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: 25,
                      color: COLOR_GREY,
                    )),
                addVerticalSpace(10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children:
                        ["<\$220,000", "For Sale", "3-4 Beds", ">1000 sqft"]
                            .map((filter) => ChoiceOption(
                                  text: filter,
                                  key: UniqueKey(),
                                ))
                            .toList(),
                  ),
                ),
                addVerticalSpace(10),
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealEstateItem(
                            itemData: RE_DATA[index],
                            key: UniqueKey(),
                          );
                        }),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              width: size.width,
              child: Center(
                child: OptionButton(
                  text: "Map View",
                  icon: Icons.map_rounded,
                  width: size.width * 0.35,
                  key: UniqueKey(),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({required Key key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headlineSmall,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({required Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  itemData: itemData,
                  key: ValueKey(itemData.id),
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(itemData["image"])),
                Positioned(
                    top: 15,
                    right: 15,
                    child: BorderBox(
                        padding: EdgeInsets.all(0),
                        key: UniqueKey(),
                        width: 0,
                        height: 0,
                        child: Icon(
                          Icons.favorite_border,
                          color: COLOR_BLACK,
                        )))
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "${formatCurrency(itemData["amount"])}",
                  style: themeData.textTheme.displayLarge,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.bodyMedium,
                )
              ],
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}
