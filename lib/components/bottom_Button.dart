import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonText, @required this.onPress});
  final String buttonText;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 22),
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 75,
        color: Colors.black54,
      ),
    );
  }
}
