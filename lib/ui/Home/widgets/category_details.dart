import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/Home/ViewModel/Sources_viewModel.dart';
import 'package:news_app/ui/Home/widgets/news_list_widget.dart';
import 'package:news_app/ui/Home/widgets/source_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel categoryModel;

  CategoryDetails({super.key, required this.categoryModel});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedSource = 0;
  var ViewModel = SourcesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.GetSources(widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) =>ViewModel,
      child:Consumer<SourcesViewModel>(
        builder: (context, ViewModel, _) {
          if(ViewModel.isLoading ){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(ViewModel.ErrorMassage !=null){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ViewModel.ErrorMassage??''),
                ElevatedButton(
                    onPressed: () {
                      ViewModel.GetSources(widget.categoryModel.id);
                    },
                    child: Text("Try again")),
              ],
            );
          }
          var sources = ViewModel.sourcesList ;
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
      ) ,)
    ;
    
  }
}
