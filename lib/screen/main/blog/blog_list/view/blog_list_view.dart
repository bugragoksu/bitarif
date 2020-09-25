import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/base/widget/base_widget.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/double_extension.dart';
import '../../../../_widgets/circular_prgress_with_scaffold.dart';
import '../../../../_widgets/columns/three_widget_title.dart';
import '../../../../_widgets/container/animated_blog_card.dart';
import '../viewmodel/blog_list_view_model.dart';

class BlogListView extends StatefulWidget {
  final String token;

  const BlogListView({Key key, @required this.token}) : super(key: key);
  @override
  _BlogListViewState createState() => _BlogListViewState();
}

class _BlogListViewState extends BaseState<BlogListView> {
  BlogListViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<BlogListViewModel>(
      viewModel: BlogListViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        viewModel = model;
        await viewModel.getBlogPosts(token: widget.token);
      },
      onPageBuilder: (BuildContext context, BlogListViewModel value) =>
          _buildBody,
    );
  }

  Widget get _buildBody => Observer(builder: (_) {
        return viewModel.isLoading
            ? ScaffoldCircularProgress()
            : BaseWidget(
                children: [
                  ThreeWidgetTitle(
                    isVisibleDoneText: false,
                    title: "inspirations",
                  ),
                  context.lowValue.toHeightSizedBox,
                  ListView.builder(
                    controller: ScrollController(),
                    shrinkWrap: true,
                    itemCount: viewModel.blogList.length,
                    itemBuilder: (_, index) => Column(
                      children: [
                        AnimatedBlogCard(
                          blog: viewModel.blogList[index],
                        ),
                        context.normalValue.toHeightSizedBox,
                      ],
                    ),
                  ),
                ],
              );
      });
}
