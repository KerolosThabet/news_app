import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel categoryModel;

  int index;

  CategoryWidget({super.key, required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(index.isEven ? 24 : 0),
            bottomLeft: Radius.circular(index.isEven ? 0 : 24),
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/${categoryModel.imagePath}'),
            height: hight * .1,
          ),
          SizedBox(height: 10,),
          Text("${categoryModel.title}", style: TextStyle(color: Colors.white,fontSize: 18),)
        ],
      ),
    );
  }
}
