import 'package:flutter/material.dart';
import 'package:news_app/date/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/sources_tab_widget/sources_tab_widget.dart';
import '../../../../../core/colors_mangers.dart';
import '../../../../../date/api_manger/api_manager.dart';
import '../../../../../date_model/categorie_Dm.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.categoryItem});

  CategoryDM categoryItem;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryItem.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: ColorsManager.green,
          ));
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        List<Source> sourcesList = snapshot.data?.sources ?? [];
        return SourcesTabWidget(sources: sourcesList);
      },
    );
  }
}
