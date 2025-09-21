import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../design.dart';
import '../../sura.dart';
import 'ChapterRow.dart';

class QuranContent extends StatefulWidget {
  const QuranContent({super.key});

  @override
  State<QuranContent> createState() => _QuranContentState();
}

class _QuranContentState extends State<QuranContent> {
  final List<Chapter> chapters = Chapter.getQuranChapter();
  List<Chapter> filterdChapters = [];


  _QuranContentState() {
    filterdChapters = chapters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (text) {
            print(text);
            filterChapters(text.toLowerCase());
          },
          decoration: InputDecoration(
              hintText: "Search for Chapter",
              hintStyle: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
              prefixIcon: ImageIcon(
                Svg(
                  AppImages.ic_Quran,
                ),
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    width: 1,
                  )
              )
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ChapterRow(chapter: filterdChapters[index]);
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.white,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 64),
              );
            },
            itemCount: filterdChapters.length,
          ),
        ),
      ],
    );
  }

  void filterChapters(String text) {
    List<Chapter> filterList = [];
    for (int i = 0; i < chapters.length; i++) {
      if (chapters[i].englishName.toLowerCase().contains(text)
          || chapters[i].arabicName.toLowerCase().contains(text)
      ) {
        filterList.add(chapters[i]);
      }
    }
    setState(() {
      filterdChapters = filterList;
    });
  }
}