import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/sources_response/Source.dart';
import 'package:news_app/style/App_colors.dart';

class SourceWidget extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceWidget({super.key, required this.source, this.isSelected = false,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5 ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: isSelected == true ? AppColors.PrimaryLightColor : Colors.white
          , borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.PrimaryLightColor),
      ),
      child: Text(source.name??"",
        style:TextStyle(
          fontSize: 20,
          color: isSelected == true ? Colors.white : AppColors.PrimaryLightColor
      ) ,
      ),
    );
  }
}
