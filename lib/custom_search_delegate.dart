import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/articales_list_widget/articales_list_widget.dart';
import 'core/assets_manger.dart';
import 'core/colors_mangers.dart';
import 'date/api_manger/api_manager.dart';
import 'date/model/articales_response/articales.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsManager.bgPattern),
        ),
      ),
      child: FutureBuilder(
        future: ApiManager.searchArticles(query: query), builder: (
          context, snapshot)
      {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: ColorsManager.green),
          );
        }
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        List<Article> articlesList = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                InkWell(
                    onTap: () {},
                    child: ArticlesListWidget.buildArticleItem(
                        context, article: articlesList[index])),
            itemCount: articlesList.length,
          ),
        );
      },),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsManager.bgPattern),
        ),
      ),
    );
  }
}