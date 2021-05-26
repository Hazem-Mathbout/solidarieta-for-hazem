import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SetLink extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;

  SetLink({this.color, this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 0.0),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 24.0,
                      width: 24.0,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                Icon(
                  LineAwesomeIcons.angle_double_right,
                  color: Colors.white,
                  size: 20.0,
                ),
              ],
            ),
          ),
          Container(
            height: 0.2,
            width: MediaQuery.of(context).size.width - 20.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
