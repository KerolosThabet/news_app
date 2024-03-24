import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/style/App_colors.dart';
import 'package:news_app/ui/Home/widgets/category_widget.dart';

typedef onCategoryClick = Function(CategoryModel categoryModel);
class CategoriesWidget extends StatelessWidget {
  onCategoryClick  categoryClick ;
   CategoriesWidget({super.key,required this.categoryClick});
List<CategoryModel>Categories =CategoryModel.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Column(
        children: [
          Row(

            children: [
              Text(
                "Pick your category \n of interest",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.TitleCategoriseColore),
              ),
            ],
          ),

          Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            ),
                itemCount:Categories.length ,
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: () {
                    categoryClick(Categories[index]);
                  },
                  child: CategoryWidget(categoryModel: Categories[index],
                      index: index),
                ),
          )),
        ],
      ),
    );
  }
}
