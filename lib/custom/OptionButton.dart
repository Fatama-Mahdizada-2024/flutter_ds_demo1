import 'package:flutter/material.dart';
import 'package:flutter_ds_demo/utils/constants.dart';
import 'package:flutter_ds_demo/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton({required Key key, required this.text, required this.icon, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
          color: COLOR_DARK_BLUE,
          splashColor: Colors.white.withAlpha(55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: COLOR_WHITE,
              ),
              addHorizontalSpace(10),
              Text(
                text,
                style: TextStyle(color: COLOR_WHITE),
              )
            ],
          )),
    );
  }
}

FlatButton({required Color color, required Color splashColor, required RoundedRectangleBorder shape, required EdgeInsets padding, required Null Function() onPressed, required Row child}) {
}

