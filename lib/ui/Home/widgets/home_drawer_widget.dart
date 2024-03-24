
import 'package:flutter/material.dart';
import 'package:news_app/style/App_colors.dart';
import 'package:news_app/ui/Home/widgets/home_drawer_widget.dart';

typedef onMenuItemClick = void Function(MenuItem item );
class HomeDrawerWidget extends StatelessWidget {
  HomeDrawerWidget({super.key,required this.selectedItem});

  onMenuItemClick selectedItem;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
             decoration:  BoxDecoration(color: AppColors.PrimaryLightColor),
            padding: EdgeInsets.symmetric(vertical: 50),
            width: double.infinity,
            child: Text( "News App !",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              selectedItem(MenuItem.Categories);
              Navigator.pop(context);
            },
            child: Row(
               children: [
                 Icon(Icons.list_outlined,color: AppColors.TextDawerColor,size: 35,),
                 SizedBox(height: 15,),
                 Text("Categories",style: Theme.of(context).textTheme.labelLarge,)
               ],
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: () {
              selectedItem(MenuItem.Settings);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(Icons.settings,color: AppColors.TextDawerColor,size: 35,),
                SizedBox(height: 15,),
                Text("Settings",style: Theme.of(context).textTheme.labelLarge,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum MenuItem{
  Categories,
  Settings
}

