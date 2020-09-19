import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/column/imaged_start_column.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../viewmodel/blog_detail_view_model.dart';

class BlogDetailView extends StatefulWidget {
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
          path:
              "https://www.abouttimemagazine.co.uk/wp-content/uploads/2016/01/10559937_941361799269538_2577068189735280194_n.jpg",
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
            child: Text(desc,
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
            Text("MAY 11,2018"),
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
            Text("Manger",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.mediumValue)),
            context.lowValue.toHeightSizedBox,
            Text("Confession of a bad blogger",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: context.normalValue)),
            context.lowValue.toHeightSizedBox,
            Text("by Mimi Thorisson")
          ],
        ),
      );

  String desc = """
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum rhoncus erat quis vulputate sodales. Duis id blandit diam. In ac blandit justo, sit amet ultricies tortor. Maecenas ornare ipsum in nisl ornare interdum. Aliquam erat volutpat. Duis tempus scelerisque viverra. Vestibulum placerat varius diam in ullamcorper. Morbi ac odio posuere, rhoncus mauris in, ullamcorper nibh. Etiam malesuada et est nec fermentum. Cras ornare ultrices pharetra. Maecenas malesuada, massa eu sodales fermentum, augue dui vehicula nisi, ut ullamcorper erat elit eget nisl. Integer ante massa, tincidunt id aliquam eget, bibendum id odio. Nunc imperdiet felis sit amet odio sodales, non malesuada felis consequat.

  Nunc bibendum sem nulla, malesuada tincidunt risus vulputate ut. Integer a tempor eros. Nam tortor odio, elementum id tristique et, dictum in risus. Nam tempor maximus dapibus. Donec quis magna nisl. Sed eget mauris ac tellus laoreet dictum quis a tortor. Donec at metus ac felis hendrerit efficitur. Donec lobortis ante massa, sit amet suscipit eros vestibulum ut. Nulla consectetur pulvinar tincidunt. Nam eros orci, fringilla vel auctor sed, tempor eu velit. Nulla tincidunt diam in augue faucibus, ac interdum enim sodales
  
  """;
}
