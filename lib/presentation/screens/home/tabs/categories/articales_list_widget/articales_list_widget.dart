import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/date/model/sources_response/source.dart';
import '../../../../../../core/colors_mangers.dart';
import '../../../../../../core/routes_manger.dart';
import '../../../../../../date/api_manger/api_manager.dart';
import '../../../../../../date/model/articales_response/articales.dart';

class ArticlesListWidget extends StatelessWidget {
  ArticlesListWidget({super.key, required this.source});

  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(source.id ?? ''),
      builder: (context, snapshot) {
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
            itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: buildArticleItem(context, article: articlesList[index])),
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }

  static Widget buildArticleItem(context, {required Article article, required}) {
  return InkWell(
  onTap: () {
  Navigator.pushNamed(
  context,
  RoutesManager.articleDetails,
  arguments: article,
  );
  },
  child: Padding(
  padding: REdgeInsets.all(12.0),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
  ClipRRect(
  borderRadius: BorderRadius.all(Radius.circular(5.r)),
  child: CachedNetworkImage(
  imageUrl: article.urlToImage ?? '',
  placeholder: (context, url) => Center(
  child: CircularProgressIndicator(
  color: ColorsManager.green,
  )),
  errorWidget: (context, url, error) => Icon(Icons.error),
  ),
  ),
  SizedBox(
  height: 6.h,
  ),
  Text(
  article.source?.name ?? '',
  style: AppStyles.articleSourceName,
  ),
  SizedBox(
  height: 6.h,
  ),
  Text(
  article.title ?? '',
  style: AppStyles.articleTitle,
  ),
  Text(
  article.publishedAt ?? '',
  style: AppStyles.articlePublishedDate,
  textAlign: TextAlign.end,
  ),
  ],
  ),
  ),
  );
  }
}