import 'package:flutter/material.dart';
import 'package:islami/UI/home/quran/ChapterRow.dart';

import '../../sura.dart';

class QuranContent extends StatelessWidget {
  QuranContent({super.key});

  final List<Chapter> chapters = Chapter.getQuranChapter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ChapterRow(chapter: chapters[index]);
            },
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 64),
                height: 1,
                color: Colors.white,
              );
            },
            itemCount: 114,
          ),
        ),
      ],
    );
  }
}
