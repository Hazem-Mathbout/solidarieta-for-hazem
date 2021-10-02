import 'package:flutter/material.dart';
import 'package:solidarieta/src/core/screens/features_screens/children_space/youtube_videos_embedding.dart';
import 'package:solidarieta/src/core/screens/features_screens/coran.dart';
import 'package:solidarieta/src/core/screens/features_screens/duaa.dart';
import 'package:solidarieta/src/core/screens/features_screens/god_names.dart';
import 'package:solidarieta/src/core/screens/features_screens/hadith.dart';

class Feature extends StatefulWidget {
  final String title;
  final Color color;
  final String imgUrl;
  final int index;

  Feature(
      {@required this.title,
      @required this.color,
      @required this.imgUrl,
      @required this.index});

  @override
  _FeatureState createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {
  List featureScreens = [
    Coran(),
    Hadith(),
    GodNames(),
    Duaa(),
    YoutubeVideosEmbedding(),
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => featureScreens[widget.index]),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 1.0),
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(50, 50, 51, 1),
            image: DecorationImage(
              image: AssetImage(widget.imgUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: widget.color, width: 1),
          ),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.7),
            child: Center(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
