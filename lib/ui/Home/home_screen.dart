import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/Home/widgets/categories_widget.dart';
import 'package:news_app/ui/Home/widgets/category_details.dart';
import 'package:news_app/ui/Home/widgets/home_drawer_widget.dart';
import 'package:news_app/ui/Home/widgets/search_view.dart';
import 'package:news_app/ui/Home/widgets/settings_widget.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String route = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 late Widget SelectedWidget ;
@override
  void initState() {
    super.initState();
    SelectedWidget = CategoriesWidget(categoryClick: onCategoryItemClick,);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Background.jpg"),
              fit: BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News App"),
          actions: [
            IconButton(onPressed: () {
              showSearch(context: context, delegate: SearchView());
              },
                icon: Icon(Icons.search))
          ],
        ),
        drawer: HomeDrawerWidget(selectedItem: onMenuItemClick,),
        body: SelectedWidget,
      ),
    );
  }

  void onMenuItemClick(MenuItem item){
    switch(item){
      case MenuItem.Categories:{
        SelectedWidget = CategoriesWidget(categoryClick:onCategoryItemClick ,);
        setState(() {

        });
      }break;
      case MenuItem.Settings:{
        SelectedWidget = SettingsWidget();
        setState(() {

        });
     } break;
    }
  }

  void onCategoryItemClick (CategoryModel categoryModel){
  SelectedWidget = CategoryDetails(categoryModel: categoryModel,);
  setState(() {});
  }
}
