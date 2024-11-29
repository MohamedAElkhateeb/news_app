import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/date/model/sources_response/source.dart';
import '../../../../../../core/colors_mangers.dart';
import '../articales_list_widget/articales_list_widget.dart';


class SourcesTabWidget extends StatefulWidget {
  SourcesTabWidget({super.key, required this.sources});

  List<Source> sources;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int selectedSourceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              selectedSourceIndex = index;
              setState(() {});
            },
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: widget.sources.map(
                  (source) {
                return buildSourceItem(
                    source: source,
                    isSelected:
                    widget.sources.indexOf(source) == selectedSourceIndex);
              },
            ).toList(),
          ),
        ),
        ArticlesListWidget(source: widget.sources[selectedSourceIndex])
      ],
    );
  }

  Widget buildSourceItem({
    required Source source,
    required bool isSelected,
  }) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: REdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.green : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
        border: Border.all(
          color: ColorsManager.green,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? '',
        style:
        isSelected ? AppStyles.selectedTabText : AppStyles.unSelectedTabText,
      ),
    );
  }
}