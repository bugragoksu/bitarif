import 'package:bitarif/screen/main/blog/blog_detail/model/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/column/imaged_start_column.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/date_extension.dart';
import '../../../../../core/extensions/double_extension.dart';
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
              icon: Icon(FeatherIcons.heart),
              onPressed: () {},
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
            Text("by Mimi Thorisson")
          ],
        ),
      );
}
