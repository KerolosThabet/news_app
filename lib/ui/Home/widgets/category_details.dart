import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/shared/api/api_manager.dart';
import 'package:news_app/ui/Home/widgets/news_list_widget.dart';
import 'package:news_app/ui/Home/widgets/source_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel categoryModel;

  CategoryDetails({super.key, required this.categoryModel});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedSource = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSource(widget.categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError || snapshot.data?.status == 'error') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Try again")),
            ],
          );
        }
        var sources = snapshot.data?.sources ?? [];
        return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TabBar(
                      onTap: (index) {
                        selectedSource = index;
                        setState(() {});
                      },
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabs: sources
                          .map((source) => SourceWidget(
                                source: source,
                                isSelected: selectedSource ==
                                    sources.indexOf(source),
                              ))
                          .toList()),
                  NewsListWidget(source:sources[selectedSource],),
                ],
              ),
            ));
      },
    );
  }
}
