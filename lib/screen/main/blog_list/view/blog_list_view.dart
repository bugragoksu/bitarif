import 'package:bitarif/core/base/widget/base_widget.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:bitarif/core/extensions/double_extension.dart';
import 'package:bitarif/screen/_widgets/card/blog_card.dart';
import 'package:bitarif/screen/_widgets/columns/three_widget_title.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/blog_list_view_model.dart';

class BlogListView extends StatefulWidget {
  @override
  _BlogListViewState createState() => _BlogListViewState();
}

class _BlogListViewState extends BaseState<BlogListView> {
  BlogListViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<BlogListViewModel>(
      viewModel: BlogListViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, BlogListViewModel value) =>
          BaseWidget(
        children: [
          ThreeWidgetTitle(
            title: "inspirations",
          ),
          context.lowValue.toHeightSizedBox,
          ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (_, index) => Column(
              children: [
                BlogCard(
                  path:
                      "https://www.abouttimemagazine.co.uk/wp-content/uploads/2016/01/10559937_941361799269538_2577068189735280194_n.jpg",
                  title: "Manger",
                  desc: "Confessions of a bad blogger",
                ),
                context.normalValue.toHeightSizedBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
