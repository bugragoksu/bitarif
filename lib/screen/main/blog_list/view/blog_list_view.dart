import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/base/widget/base_widget.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../_widgets/columns/three_widget_title.dart';
import '../../../_widgets/container/animated_blog_card.dart';
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
            isVisibleDoneText: false,
            title: "inspirations",
          ),
          context.lowValue.toHeightSizedBox,
          ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (_, index) => Column(
              children: [
                AnimatedBlogCard(),
                context.normalValue.toHeightSizedBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
