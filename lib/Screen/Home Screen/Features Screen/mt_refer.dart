import 'package:cash_rocket/Model/user_profile_model.dart';
import 'package:cash_rocket/Screen/Constant%20Data/main_button.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Provider/database_provider.dart';
import '../../../Provider/profile_provider.dart';
import '../../Authentication/log_in.dart';
import '../../Constant Data/constant.dart';
import '../no_internet_screen.dart';

class Refer extends StatefulWidget {
  const Refer({Key? key}) : super(key: key);

  @override
  State<Refer> createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  final TextEditingController _textController = TextEditingController(text: '5FLK2M');

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _textController.text));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // content: Text('Invitation Code Copied'),
      content: Text(lang.S.of(context).invitationCodeCopied),
    ));
  }

  bool isBalanceShow = false;

  bool isChecked = true;

  Future<void> checkInternet() async {
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = await InternetConnection().hasInternetAccess;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          lang.S.of(context).refer,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))),
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: containerGradiant, borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))),
        ),
      ),
      body: SafeArea(
        child: Consumer(builder: (_, ref, watch) {
          AsyncValue<UserProfileModel> referCode = ref.watch(personalProfileProvider);
          return referCode.when(data: (code) {
            if (code.data?.user?.status == 0) {
              // EasyLoading.showError('You Are Disable!');
              EasyLoading.showError(lang.S.of(context).youAreDisable);
              DataBase().deleteToken();
              const LogIn().launch(context, isNewTask: true);
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff0E3E7B),
                    ),
                    BoxShadow(
                      color: Color(0xff262450),
                      spreadRadius: 0.0,
                      blurRadius: 16.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      lang.S.of(context).inviteYourFriends,
                      style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      lang.S.of(context).inviteYourFriendtoUseCashRocket,
                      style: kTextStyle.copyWith(color: kLightTextColor),
                      maxLines: 5,
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      height: 235,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/refferbanner1.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    AppTextField(
                      readOnly: true,
                      textFieldType: TextFieldType.NAME,
                      initialValue: code.data?.user?.referCode ?? '',
                      textAlign: TextAlign.center,
                      textStyle: kTextStyle.copyWith(color: kWhite),
                      decoration: kInputDecoration.copyWith(
                          hintStyle: TextStyle(color: kLightTextColor),
                          labelStyle: kTextStyle.copyWith(color: kWhite),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: kMainColor, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: kMainColor, width: 1),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          border: InputBorder.none,
                          hintText: code.data?.user?.referCode ?? '',
                          suffixIcon: const Icon(FeatherIcons.copy, color: kMainColor).onTap(() {
                            setState(() {
                              _copyToClipboard();
                            });
                          })),
                    ),
                    const SizedBox(height: 16.0),
                    PrimaryButton(
                      buttonText: lang.S.of(context).inviteNow,
                      onpressed: (() => Share.share('I have earned \$100 in a day. Use my refer code to earn \$10 on signup. My Refer Code is ${code.data?.user?.referCode ?? ''}')),
                    ),
                  ],
                ),
              ),
            );
          }, error: (e, stack) {
            return Center(
              child: Text(e.toString()),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        }),
      ),
    );
  }
}
