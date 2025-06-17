// ignore_for_file: unused_result
import 'package:cash_rocket/Model/user_profile_model.dart';
import 'package:cash_rocket/Model/withdraw_method_model.dart';
import 'package:cash_rocket/Repositories/withdraw_repo.dart';
import 'package:cash_rocket/Screen/Constant%20Data/main_button.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../Model/purchase_model.dart';
import '../../../Model/withdraw_currency_convert_model.dart';
import '../../../Provider/database_provider.dart';
import '../../../Provider/profile_provider.dart';
import '../../../constant app information/const_commas.dart';
import '../../Constant Data/constant.dart';
import '../home.dart';
import '../no_internet_screen.dart';

class Redeem extends StatefulWidget {
  const Redeem({Key? key}) : super(key: key);

  @override
  State<Redeem> createState() => _RedeemState();
}

class _RedeemState extends State<Redeem> {
  List<String> logoList = [
    'images/paypal.png',
    'images/bkash.png',
    'images/paytm.png',
    'images/stripe.png',
  ];
  List<String> bgList = [
    'images/bg3.png',
    'images/bg1.png',
    'images/bg4.png',
    'images/bg2.png',
  ];

  List<String> bankList = [
    'PayPal',
    'bkash',
    'Paytm',
    'Stripe',
  ];

  List<String> listTitle = [
    'Minimum 1000 Points',
    'Minimum 1000 Points',
    'Minimum 1000 Points',
    'Minimum 1000 Points',
  ];

  bool isBalanceShow = false;
  int methodId = 0;
  int currencyId = 0;
  double minimumAMount = 0;
  TextEditingController coinsController = TextEditingController();
  TextEditingController accountController = TextEditingController();
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
    return Consumer(builder: (_, ref, watch) {
      AsyncValue<UserProfileModel> profileInfo = ref.watch(personalProfileProvider);
      AsyncValue<WithdrawMethodModel> withdrawInfo = ref.watch(withdrawMethodProvider);
      AsyncValue<WithdrawCurrencyConvertModel> currencyInfo = ref.watch(withdrawCurrencyProvider);
      return profileInfo.when(data: (info) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: 90,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: containerGradiant, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            elevation: 0.0,
            title: Text(
              lang.S.of(context).redeem,
              style: kTextStyle.copyWith(color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBalanceShow = !isBalanceShow;
                    });
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    height: 32,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedOpacity(
                          opacity: !isBalanceShow ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: kBalanceGradiant,
                            ),
                            child: const Icon(
                              FeatherIcons.dollarSign,
                              size: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          isBalanceShow ? myFormat.format(info.data?.user?.wallet?.balance) : lang.S.of(context).balance,
                          style: mediumTextStyle,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(width: 5.0),
                        AnimatedOpacity(
                          opacity: isBalanceShow ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: kBalanceGradiant,
                            ),
                            child: const Icon(
                              FeatherIcons.dollarSign,
                              size: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async => ref.refresh(withdrawMethodProvider),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5.0),
                    withdrawInfo.when(data: (info) {
                      return HorizontalList(
                          padding: EdgeInsets.zero,
                          spacing: 10.0,
                          itemCount: info.data?.withdrawMethod?.length ?? 0,
                          itemBuilder: (_, i) {
                            return Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                                  height: 115,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(image: AssetImage(bgList[i % 4]), fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 20.0,
                                            backgroundImage: NetworkImage(
                                              info.data?.withdrawMethod?[i].image ?? 'https://cdn-icons-png.flaticon.com/512/888/888871.png',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 80.0,
                                          ),
                                          Transform.scale(
                                              scaleX: 3.0,
                                              scaleY: 3.0,
                                              child: const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 12.0,
                                              )).visible(methodId == info.data!.withdrawMethod![i].id!),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      SizedBox(
                                        width: 140,
                                        child: Text(
                                          info.data?.withdrawMethod?[i].name ?? 'Not Defined',
                                          style: kTextStyle.copyWith(
                                            color: Colors.white,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        '${info.data?.withdrawMethod?[i].minimumAmount ?? '0'}(minimum)',
                                        style: kTextStyle.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ).onTap(() {
                              setState(() {
                                methodId = int.parse(info.data!.withdrawMethod![i].id.toString());
                                minimumAMount = info.data!.withdrawMethod![i].minimumAmount!.toDouble();
                              });
                            });
                          });
                    }, error: (e, stack) {
                      return Center(
                        child: Text(e.toString()),
                      );
                    }, loading: () {
                      return const Center(child: CircularProgressIndicator());
                    }),
                    const SizedBox(height: 20.0),
                    currencyInfo.when(data: (currency) {
                      return HorizontalList(
                          itemCount: currency.data?.currencyConvertInfo?.length ?? 0,
                          itemBuilder: (_, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), border: Border.all(color: kWhite)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${currency.data?.currencyConvertInfo?[index].currency?.symbol ?? ''} ${currency.data?.currencyConvertInfo?[index].currency?.isoCode ?? ''} (${currency.data?.currencyConvertInfo?[index].currency?.name ?? ''})',
                                        style: kTextStyle.copyWith(color: kWhite),
                                      ),
                                      const SizedBox(
                                        width: 4.0,
                                      ),
                                      const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ).visible(currencyId == currency.data!.currencyConvertInfo![index].id!)
                                    ],
                                  ),
                                ).onTap(() {
                                  setState(() {
                                    currencyId = int.parse(currency.data?.currencyConvertInfo?[index].id.toString() ?? '0');
                                  });
                                }),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  '${currency.data?.currencyConvertInfo?[index].parCurrency ?? ''} ${currency.data?.currencyConvertInfo?[index].currency?.isoCode ?? ''} = ${currency.data?.currencyConvertInfo?[index].coin ?? ''} coins',
                                  style: kTextStyle.copyWith(color: kWhite),
                                ).visible(currencyId == currency.data!.currencyConvertInfo![index].id!)
                              ],
                            );
                          });
                    }, error: (e, stack) {
                      return Center(
                        child: Text(e.toString()),
                      );
                    }, loading: () {
                      return const Center(child: CircularProgressIndicator());
                    }),
                    const SizedBox(height: 10.0),
                    AppTextField(
                      cursorColor: kMainColor,
                      textFieldType: TextFieldType.NAME,
                      textAlign: TextAlign.start,
                      controller: coinsController,
                      textStyle: kTextStyle.copyWith(color: kWhite),
                      decoration: kInputDecoration.copyWith(
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: lang.S.of(context).enterCoinAmount,
                        hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    AppTextField(
                      cursorColor: kMainColor,
                      textFieldType: TextFieldType.NAME,
                      controller: accountController,
                      textAlign: TextAlign.start,
                      textStyle: kTextStyle.copyWith(color: kWhite),
                      decoration: kInputDecoration.copyWith(
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: lang.S.of(context).withdrawAccount,
                        hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    PrimaryButton(
                      buttonText: lang.S.of(context).withdraw,
                      onpressed: (() async {
                        if (methodId == 0 && currencyId == 0) {
                          //EasyLoading.showError('Please Select Withdraw Method and Currency');
                          EasyLoading.showError(lang.S.of(context).pleaseSelectWithdrawMethodAndCurrency);
                        } else if (coinsController.text.isEmpty) {
                          //EasyLoading.showError('Please Enter the amount');
                          EasyLoading.showError(lang.S.of(context).pleaseEnterTheAmount);
                        } else if (accountController.text.isEmpty) {
                          //EasyLoading.showError('Please Enter the withdraw account');
                          EasyLoading.showError(lang.S.of(context).pleaseEnterTheWithdrawAccount);
                        } else if (coinsController.text.toDouble() < minimumAMount) {
                          //EasyLoading.showError('Minimum withdraw balance is $minimumAMount');
                          EasyLoading.showError('${lang.S.of(context).minimumWithdrawBalanceIs} $minimumAMount');
                        } else if (info.data!.user!.wallet!.balance!.toInt() < coinsController.text.toInt()) {
                          // EasyLoading.showError('Not Enough Balance');
                          EasyLoading.showError(lang.S.of(context).notEnoughBalance);
                        } else {
                          try {
                            //EasyLoading.show(status: 'Requesting Withdraw');
                            EasyLoading.show(status: lang.S.of(context).requestingWithdraw);
                            bool isValid = await PurchaseModel().isActiveBuyer();
                            if (isValid) {
                              var status = await WithdrawRepo().withdrawRequestInfo(methodId.toString(), currencyId.toString(), coinsController.text, accountController.text);
                              if (status && mounted) {
                                //EasyLoading.showSuccess('Withdraw requested Successfully');
                                EasyLoading.showSuccess(lang.S.of(context).withdrawRequestedSuccessfully);
                                ref.refresh(personalProfileProvider);
                                const Home().launch(context);
                              } else {
                                //EasyLoading.showError('Error Occurred');
                                EasyLoading.showError(lang.S.of(context).errorOccurred);
                              }
                            } else {
                              // ignore: use_build_context_synchronously
                              showLicense(context: context);
                            }
                          } catch (e) {
                            EasyLoading.showError(e.toString());
                          }
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }, error: (e, stack) {
        return Center(
          child: Text(e.toString()),
        );
      }, loading: () {
        return const CircularProgressIndicator();
      });
    });
  }
}
