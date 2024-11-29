import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/category_detail.dart';
import 'package:news_app/presentation/screens/home/tabs/settings/settings.dart';
import '../../../core/assets_manger.dart';
import '../../../core/colors_mangers.dart';
import '../../../core/strings_manger.dart';
import '../../../custom_search_delegate.dart';
import '../../../date_model/categorie_Dm.dart';
import 'home_drawer/home_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedTab ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedTab = Categories(onCategoryClicked: onCategoryClicked,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsManager.bgPattern),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: CustomSearchDelegate()
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
            title: Text(
              StringsManager.appTitle,
            )),
        drawer: DrawerWidget(
          selectMenuItem: onDrawerItemClicked,
        ),
        body: selectedTab,
      ),
    );
  }

  void onCategoryClicked(CategoryDM category) {
    selectedTab = CategoryDetails(categoryItem: category);
    setState(() {});
  }

  void onDrawerItemClicked(DrawerItem item) {
    Navigator.pop(context);
    if (item == DrawerItem.categories) {
      selectedTab = Categories(onCategoryClicked: onCategoryClicked);
    } else if (item == DrawerItem.settings) {
      selectedTab = Settings();
    }
    setState(() {});
  }
}