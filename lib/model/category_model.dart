import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.backgroundColor,
      required this.imagePath});

  static List<CategoryModel> getAllCategories() => [
        CategoryModel(
            id: "sports",
            title: "Sports",
            imagePath: "sports.png",
            backgroundColor: Color(0xffC91C22)),
        CategoryModel(
            id: "general",
            title: "General",
            imagePath: "Politics.png",
            backgroundColor: Color(0xff003E90)),
        CategoryModel(
            id: "health",
            title: "Health",
            imagePath: "health.png",
            backgroundColor: Color(0xffED1E79)),
        CategoryModel(
            id: "business",
            title: "Business",
            imagePath: "bussines.png",
            backgroundColor: Color(0xffCF7E48)),
        CategoryModel(
            id: "technology",
            title: "Technology",
            imagePath: "Technology.png",
            backgroundColor: Color(0xff4882CF)),
        CategoryModel(
            id: "science",
            title: "Science",
            imagePath: "science.png",
            backgroundColor: Color(0xffF2D352)),
      ];
}
