// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator_app/ui/widget/snackBar.dart';

class ExpansionTileWidget extends StatefulWidget {
  final String slangTitle;
  final String malayTitle;
  final String englishTitle;

  ExpansionTileWidget({
    super.key,
    required this.slangTitle,
    required this.malayTitle,
    required this.englishTitle,
  });

  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  final audioPlayer = AudioPlayer();

  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(widget.slangTitle),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text('Copy'),
                    onTap: () async {
                      await Clipboard.setData(
                          ClipboardData(text: widget.slangTitle));
                      SnackBarWidget.succesSnackbar(context,
                          snackBarContent: 'Copied to clipboard!',
                          labelContent: 'Close');
                    },
                  ),
                ];
              },
            ),
          ],
        ),
        children: <Widget>[
          ExpansionTile(
            title: Text(widget.malayTitle),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text('Copy'),
                        onTap: () async {
                          await Clipboard.setData(
                              ClipboardData(text: widget.malayTitle));
                          SnackBarWidget.succesSnackbar(context,
                              snackBarContent: 'Copied to clipboard!',
                              labelContent: 'Close');
                        },
                      ),
                    ];
                  },
                ),
              ],
            ),
            children: [
              ListTile(
                  title: Text(widget.englishTitle),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Text('Copy'),
                              onTap: () async {
                                await Clipboard.setData(
                                    ClipboardData(text: widget.englishTitle));
                                SnackBarWidget.succesSnackbar(context,
                                    snackBarContent: 'Copied to clipboard!',
                                    labelContent: 'Close');
                              },
                            ),
                          ];
                        },
                      ),
                    ],
                  )),
            ],
          )
        ]);
  }
}

// IconButton(
//   icon: Icon(Icons.play_arrow_sharp),
//   iconSize: 30,
//   onPressed: () async {
//     await audioPlayer.play(AssetSource(widget.assetUrl));
//   },
// ),
