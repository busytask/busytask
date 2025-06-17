import 'package:cash_rocket/Model/video_model.dart';
import 'package:cash_rocket/Screen/Video%20List/blank_video_list.dart';
import 'package:cash_rocket/Screen/Video%20List/play_video.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Provider/profile_provider.dart';
import '../Constant Data/config.dart';
import '../Constant Data/constant.dart';

class VideoList extends StatefulWidget {
  const VideoList({super.key});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  bool isBalanceShow = false;
  List<String> imageList = [
    'images/z5.png',
    'images/z1.png',
    'images/z3.png',
    'images/z4.png',
    'images/z5.png',
  ];

  String extractVideoId(String url) {
    // Regular expression for YouTube URL formats
    RegExp regExp = RegExp(
      r"(?:(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|embed|e)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11}))",
      caseSensitive: false,
      multiLine: false,
    );

    // Match the YouTube URL with the regular expression
    RegExpMatch? match = regExp.firstMatch(url);

    // If there is a match, return the video ID
    return match != null ? match.group(1) ?? '' : '';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      AsyncValue<VideoModel> videoList = ref.watch(videoProvider);

      return videoList.when(data: (videos) {
        if (videos.data!.isEmpty) {
          return const BlankVideoList();
        } else {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              toolbarHeight: 90,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
              backgroundColor: kMainColor,
              iconTheme: const IconThemeData(color: kWhite),
              elevation: 0.0,
              title: Text(
                lang.S.of(context).customVideos,
                style: kTextStyle.copyWith(color: Colors.white),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: containerGradiant, borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${lang.S.of(context).totalVideos}: ${videos.data?.length ?? 0}',
                      style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kWhite),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      lang.S.of(context).watchAVideoOnlyOneTimeInADay,
                      style: kTextStyle.copyWith(color: kLightTextColor),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                        itemCount: videos.data?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, i) {
                          if (kDebugMode) {
                            print('Video Title: ${videos.data?[i].title}');
                          }
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xff0E3E7B),
                                  ),
                                  BoxShadow(
                                    color: Color(0xff262450),
                                    spreadRadius: 0.0,
                                    blurRadius: 10.0,
                                  ),
                                ],
                                // boxShadow: const [BoxShadow(color: kDarkWhite, spreadRadius: 5, blurRadius: 16, offset: Offset(5, 5))]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 76,
                                      width: 76,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(Config.siteUrl + (videos.data?[i].thumbnail ?? "")))),
                                    ),
                                    // Image.network(
                                    //   Config.siteUrl + (videos.data?[i].thumbnail ?? ""),
                                    //   height: 76,
                                    //   width: 76,
                                    // ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          videos.data?[i].title ?? "",
                                          style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kWhite),
                                        ),
                                        const SizedBox(height: 5),

                                        Text(' ${videos.data?[i].coins ?? ""} ${lang.S.of(context).coins}', style: kTextStyle.copyWith(color: kWhite, fontSize: 13)),
                                        // RichText(
                                        //     text: TextSpan(text: lang.S.of(context).watchVideoAndEarn, style: kTextStyle.copyWith(fontSize: 13, color: kGreyTextColor), children: [
                                        //   TextSpan(
                                        //       text: ' ${videos.data?[i].coins ?? ""} ${lang.S.of(context).coins}', style: kTextStyle.copyWith(color: kTitleColor, fontSize: 13)),
                                        // ])),
                                        const SizedBox(height: 5),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => PlayVideo(
                                                  video: videos.data![i],
                                                  videoId: extractVideoId(videos.data![i].videoLink ?? ""),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 26,
                                            width: 90,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: buttonGradiant),
                                            child: Text(
                                              lang.S.of(context).playVideo,
                                              style: kTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          );
        }
      }, error: (e, stack) {
        return Center(
          child: Text(e.toString()),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
    });
  }
}
