import 'package:cash_rocket/Model/website_visit_model.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import '../../Provider/profile_provider.dart';
import '../../Repositories/authentication_repo.dart';
import '../Constant Data/constant.dart';

class VisitWebsite extends StatefulWidget {
  const VisitWebsite({super.key, required this.url});
  final Data url;

  @override
  State<VisitWebsite> createState() => _VisitWebsiteState();
}

class _VisitWebsiteState extends State<VisitWebsite> {
  late final WebViewController _controller;
  final CountDownController _coount_controller = CountDownController();

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            //debugPrint('WebView is loading (progress : $progress%)');
            debugPrint('${lang.S.of(context).webViewIsLoadingProgress} : $progress%)');
          },
          onPageStarted: (String url) {
            //debugPrint('Page started loading: $url');
            debugPrint('${lang.S.of(context).pageStartedLoading}: $url');
          },
          onPageFinished: (String url) {
            _coount_controller.start();
            //debugPrint('Page finished loading: $url');
            debugPrint('${lang.S.of(context).pageFinishedLoading}: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
  ${lang.S.of(context).pageResourceError}:
  ${lang.S.of(context).code}: ${error.errorCode}
  ${lang.S.of(context).description}: ${error.description}
  ${lang.S.of(context).errorType}: ${error.errorType}
  ${lang.S.of(context).isForMainFrame}: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              //debugPrint('blocking navigation to ${request.url}');
              debugPrint('${lang.S.of(context).blockingNavigationTo} ${request.url}');
              return NavigationDecision.prevent;
            }
            //debugPrint('allowing navigation to ${request.url}');
            debugPrint('${lang.S.of(context).allowingNavigationTo} ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            //debugPrint('url change to ${change.url}');
            debugPrint('${lang.S.of(context).urlChangeTo} ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.url.url ?? ""));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: containerGradiant),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            widget.url.title ?? "",
            style: kTextStyle.copyWith(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircularCountDownTimer(
                duration: widget.url.duration!.toInt(),
                initialDuration: 0,
                controller: _coount_controller,
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
                autoStart: false,
                onStart: () async {
                  //await Future.delayed(const Duration(seconds: 20)).then((value) => assetsAudioPlayer.open(Audio('images/tick.mp3'),autoStart: true,showNotification: false));
                },
                onChange: (val) {},
                onComplete: () async {
                  try {
                    //EasyLoading.show(status: "Getting reward");
                    EasyLoading.show(status: lang.S.of(context).gettingReward);
                    bool status = await AuthRepo().visitWebsite(widget.url.id.toString());
                    if (status) {
                      ref.refresh(websiteProvider);
                      ref.refresh(personalProfileProvider);
                      //EasyLoading.showSuccess("Rewarded Successfully");
                      EasyLoading.showSuccess(lang.S.of(context).rewardedSuccessfully);
                    } else {
                      //EasyLoading.showError("Error Occured");
                      EasyLoading.showError(lang.S.of(context).errorOccurred);
                    }
                  } catch (e) {
                    EasyLoading.showError(e.toString());
                  }
                },
              ),
            )
          ],
        ),
        body: WebViewWidget(controller: _controller),
      );
    });
  }
}
