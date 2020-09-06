// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_viewer/models/story_item.dart';
import 'package:story_viewer/models/user.dart';
import 'package:story_viewer/viewer.dart';
import 'package:story_viewer/viewer_controller.dart';

class DetailedHome extends StatefulWidget {
  @override
  _DetailedHomeState createState() => _DetailedHomeState();
}

class _DetailedHomeState extends State<DetailedHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CupertinoButton(
                    child: Column(
                      children: [
                        Text("Basic"),
                        Icon(Icons.image),
                      ],
                    ),
                    onPressed: () {
                      pushStoryView(true);
                    }),
                CupertinoButton(
                    child: Column(
                      children: [
                        Text("Complex"),
                        Icon(Icons.camera),
                      ],
                    ),
                    onPressed: () {
                      pushStoryView(false);
                    }),
              ],
            ),
            StoryViewer(
              key: ValueKey("2"),
              progressBorderRadius: BorderRadius.all(Radius.circular(12)),
              backgroundColor: Colors.blueGrey,
              ratio: StoryRatio.r4_3,
              stories: [
                StoryItemModel(
                    displayDuration: Duration(seconds: 10),
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/app-monotony.appspot.com/o/assets%2Fmonotony-brand-02.png?alt=media&token=49d1d989-ac74-4d00-a816-e1680172e707"),
                StoryItemModel(
                    displayDuration: Duration(seconds: 10),
                    url:
                        "https://lh3.googleusercontent.com/r87lupz1w9JaLb6_8UZtBWnR1bu4rjC6yWV69pqfSy2PZzB7lAwNjR8fyWyruShu_dk"),
              ],
              userModel: UserModel(
                username: "monotony",
                profilePictureUrl:
                    "https://lh3.googleusercontent.com/vzstCu3rediu8YxljS-3oA7qNDVmet-Wl2VQpoWCOMN4zqirKdOAhNJZXU98Y6QMOiE=s180",
              ),
            ),
          ],
        ),
      ),
    );
  }

  pushStoryView(bool basic) {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) =>
            basic ? basicStoryViewer() : complexStoryViewer()));
  }

  Widget basicStoryViewer() {
    return StoryViewer(
      displayerUserID: "displayer",
      hasReply: true,
      stories: [
        StoryItemModel(
            url:
                "https://media.vanityfair.com/photos/5d1517768d443600098464f6/9:16/w_747,h_1328,c_limit/mark-zuckerberg-democracy.jpg"),
      ],
      userModel: UserModel(
        username: "mark",
        profilePictureUrl: "https://static.toiimg.com/photo/46453492.cms",
      ),
    );
  }

  Widget complexStoryViewer() {
    return StoryViewer(
      hasReply: true,
      stories: [
        StoryItemModel(
            displayDuration: Duration(seconds: 20),
            storyTime: DateTime(2020, 10),
            url:
                "https://media.vanityfair.com/photos/5d1517768d443600098464f6/9:16/w_747,h_1328,c_limit/mark-zuckerberg-democracy.jpg"),
        StoryItemModel(
            url:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQAnIurstDvh-haWAitgz09yWDcUTJ9ZMxVFg&usqp=CAU"),
      ],
      userModel: UserModel(
        username: "zuckerberg",
        profilePictureUrl: "https://static.toiimg.com/photo/46453492.cms",
      ),
      profilePicture: ClipOval(
        child: Image.network(
          "https://static.toiimg.com/photo/46453492.cms",
          width: 32,
          height: 32,
          fit: BoxFit.fitHeight,
        ),
      ),
      getAdditionalLayersBeforeMedia: ({
        StoryViewer viewer,
        StoryViewerController viewerController,
      }) {
        return [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          )
        ];
      },
      getAdditionalLayersAfterMedia: ({
        StoryViewer viewer,
        StoryViewerController viewerController,
      }) {
        return [
          IntrinsicHeight(
              child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            )),
            child: Text(
              "This is an additional layer for ${viewerController.currentIndex}",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          )),
        ];
      },
      placeholderBackground: Colors.blueGrey,
      backgroundColor: Colors.grey,
      mediaAlignment: Alignment.center,
    );
  }
}