import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:cash_rocket/Model/video_model.dart';
import 'package:cash_rocket/Provider/profile_provider.dart';
import 'package:cash_rocket/Repositories/authentication_repo.dart';
import 'package:cash_rocket/Screen/Constant%20Data/config.dart';
import 'package:cash_rocket/Screen/Constant%20Data/constant.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.video, required this.videoId});
  final Data video;
  final String videoId;

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  final CountDownController _controller = CountDownController();

  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  late YoutubePlayerController _ycontroller;

  @override
  void initState() {
    super.initState();
    if (widget.video.type == "video") {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(Config.siteUrl + widget.video.videoLink!))..initialize().then((value) => setState(() {}));
      _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
      );
      videoPlayerController.play().then((value) => _controller.restart(duration: widget.video.duration.toInt()));
      videoPlayerController.setLooping(true);
    } else {
      _ycontroller = YoutubePlayerController.fromVideoId(
        videoId: widget.videoId,
        autoPlay: true,
        params: const YoutubePlayerParams(showFullscreenButton: true),
      );
    }
  }

  bool isDone = false;

  @override
  void dispose() {
    videoPlayerController.dispose();
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      return WillPopScope(
        onWillPop: () async {
          return isDone;
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: kWhite),
              title: Text(
                lang.S.of(context).watchVideo,
                style: mediumTextStyle.copyWith(fontSize: 18),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: containerGradiant),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularCountDownTimer(
                    duration: widget.video.duration.toInt(),
                    initialDuration: 0,
                    controller: _controller,
                    height: 50.0,
                    width: 50.0,
                    ringColor: Colors.grey[300]!,
                    ringGradient: null,
                    fillColor: Colors.white,
                    fillGradient: null,
                    backgroundColor: Colors.transparent,
                    backgroundGradient: null,
                    strokeWidth: 3.0,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    textFormat: CountdownTextFormat.S,
                    isReverse: true,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    autoStart: true,
                    onStart: () async {
                      //await Future.delayed(const Duration(seconds: 20)).then((value) => assetsAudioPlayer.open(Audio('images/tick.mp3'),autoStart: true,showNotification: false));
                    },
                    onChange: (val) {},
                    onComplete: () async {
                      try {
                        //EasyLoading.show(status: "Getting reward");
                        EasyLoading.show(status: lang.S.of(context).gettingReward);
                        bool status = await AuthRepo().watchVideo(widget.video.id.toString());
                        if (status) {
                          ref.refresh(videoProvider);
                          ref.refresh(personalProfileProvider);
                          // EasyLoading.showSuccess("Rewarded Successfully");
                          EasyLoading.showSuccess(lang.S.of(context).rewardedSuccessfully);
                        } else {
                          // EasyLoading.showError("Error Occured");
                          EasyLoading.showError(lang.S.of(context).errorOccurred);
                        }
                      } catch (e) {
                        EasyLoading.showError(e.toString());
                      }
                      setState(() {
                        isDone = !isDone;
                      });
                    },
                  ),
                )
              ],
            ),
            body: Center(
                child: widget.video.type == "video"
                    ? CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController)
                    : YoutubePlayer(
                        controller: _ycontroller,
                        aspectRatio: 16 / 9,
                      )),
          ),
        ),
      );
    });
  }
}
