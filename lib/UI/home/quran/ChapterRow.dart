import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/routes.dart';

import '../../Chapter.dart';

class ChapterRow extends StatelessWidget {
  Chapter chapter;

  ChapterRow({required this.chapter, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.ChapterDetails.route,
          arguments: chapter,
        );
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: Svg(AppImages.ic_chapter)),
                  ),
                  child: Text(
                    "${chapter.chapterIndex}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                SizedBox(width: 24),
                Column(
                  children: [
                    Text(
                      chapter.englishName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "${chapter.versesNumber} verses",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              chapter.arabicName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
