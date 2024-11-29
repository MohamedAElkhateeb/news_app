import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/assets_manger.dart';
import '../../../../../../core/colors_mangers.dart';
import '../../../../../../date/model/articales_response/articales.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)!.settings.arguments as Article;
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(article.title ?? ''),
        ),
        body: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              SizedBox(
                height: 20.h,
              ),
              Text(
                article.content ?? '',
                style: AppStyles.articleContent,
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  print(article.url);
                  _launchInAppWithBrowserOptions(Uri.parse(article.url ?? ""));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Full Article',
                      style: AppStyles.articleTitle,
                      textAlign: TextAlign.end,
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchInAppWithBrowserOptions(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}