import 'package:flutter/material.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/column/imaged_start_column.dart';
import '../../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/date_extension.dart';
import '../../../../../core/extensions/double_extension.dart';
import '../../../../../core/init/cache/locale_manager.dart';
import '../model/blog.dart';
import '../viewmodel/blog_detail_view_model.dart';

class BlogDetailView extends StatefulWidget {
  final BlogPost blog;

  const BlogDetailView({Key key, @required this.blog}) : super(key: key);
  @override
  _BlogDetailViewState createState() => _BlogDetailViewState();
}

class _BlogDetailViewState extends BaseState<BlogDetailView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<BlogDetailViewModel>(
      viewModel: BlogDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BlogDetailViewModel value) =>
          Scaffold(
        body: SingleChildScrollView(
            child: ImagedStartColumn(
          children: _buildChildren,
          isNetwork: true,
          path: widget.blog.imageLink,
        )),
      ),
    );
  }

  List<Widget> get _buildChildren => [
        _buildDateAndLikeRow,
        _buildBlogInfo,
        context.normalValue.toHeightSizedBox,
        Container(
            padding: context.paddingNormal,
            alignment: Alignment.centerLeft,
            child: Text(widget.blog.text,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: context.normalValue)))
      ];

  Widget get _buildDateAndLikeRow => Padding(
        padding: context.paddingNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.blog.createdDate.toParsedString),
            IconButton(
              icon: Icon(isFav() ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                setState(() {
                  isFav() ? delFavList() : addFavList();
                });
              },
            )
          ],
        ),
      );

  Widget get _buildBlogInfo => Container(
        padding: context.paddingNormal,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.blog.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.mediumValue)),
            context.lowValue.toHeightSizedBox,
            Text(widget.blog.desc,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: context.normalValue)),
            context.lowValue.toHeightSizedBox,
            Text("by " + widget.blog.author.name)
          ],
        ),
      );

  String getFavList() {
    return LocaleManager.instance.getStringValue(PreferencesKeys.FAV_BLOGS);
  }

  void addFavList() {
    String favList = getFavList();
    favList += "${widget.blog.id},";
    LocaleManager.instance.setStringValue(PreferencesKeys.FAV_BLOGS, favList);
  }

  void delFavList() {
    String favList = getFavList();
    String newFav = "";
    List<String> recipeIdList = favList.split(',');
    for (var i = 0; i < recipeIdList.length; i++) {
      if (!recipeIdList[i].contains(widget.blog.id.toString())) {
        newFav += recipeIdList[i] + ",";
      }
    }
    LocaleManager.instance.setStringValue(PreferencesKeys.FAV_BLOGS, newFav);
  }

  bool isFav() {
    bool result = false;
    String favList = getFavList();

    List<String> blogIdList = favList.split(',');
    for (var i = 0; i < blogIdList.length; i++) {
      if (blogIdList[i].contains(widget.blog.id.toString())) {
        result = true;
        break;
      }
    }

    return result;
  }
}
