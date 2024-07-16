import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:wow/core/extensions/context/theme.dart';
import 'package:wow/core/manager/language/locale_keys.g.dart';
import 'package:wow/core/models/saved_item.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  Color _getRandomColor() {
    final items = [
      context.customColors.red!,
      context.customColors.blue!,
      context.customColors.green!,
      context.customColors.purple!,
    ];

    return items[Random().nextInt(items.length)];
  }

  List<SavedItem> data = [
    SavedItem(
      title: 'First saved',
      subtitle: 'yihuuu',
    ),
    SavedItem(
      title: 'second saved',
      subtitle: 'whattt',
    ),
    SavedItem(
      title: 'anddd third',
      subtitle: 'lorem ipsum dolor sit amet adipiscing',
    ),
    SavedItem(
      title: 'Title 30302',
      subtitle: 'elut mondi falan fil an',
    ),
    SavedItem(
      title: 'title 00',
      subtitle: 'I love you',
    ),
    SavedItem(
      title: 'Title 2',
      subtitle: 'subtitle',
    ),
    SavedItem(
      title: 'Title 4',
      subtitle: 'subtitle',
    ),
    SavedItem(
      title: 'Title 5',
      subtitle: 'subtitle',
    ),
    SavedItem(
      title: 'Title 3',
      subtitle: 'subtitle',
    ),
    SavedItem(
      title: 'Title 9',
      subtitle: 'subtitle',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: item.color ?? _getRandomColor(),
          ),
          title: Text(item.title),
          subtitle: Text(item.subtitle),
          trailing: PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(LocaleKeys.share.tr()),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Share!!',
                        ),
                      ),
                    );
                  },
                ),
                PopupMenuItem(
                  child: Text(LocaleKeys.save.tr()),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Save!!',
                        ),
                      ),
                    );
                  },
                ),
              ];
            },
          ),
        );
      },
    );
  }
}
