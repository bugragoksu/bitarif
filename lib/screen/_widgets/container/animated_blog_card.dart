import 'package:bitarif/screen/main/blog/blog_detail/model/blog.dart';
import 'package:flutter/material.dart';

import '../../../core/components/container/animated_open_container.dart';
import '../../main/blog/blog_detail/view/blog_view.dart';
import '../card/blog_card.dart';

class AnimatedBlogCard extends StatelessWidget {
  final BlogPost blog;

  const AnimatedBlogCard({Key key, @required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpenContainer(
      closeWidget: BlogCard(
        path: blog.imageLink,
        title: blog.title,
        desc: blog.desc,
      ),
      openWidget: BlogDetailView(blog: blog),
    );
  }
}
