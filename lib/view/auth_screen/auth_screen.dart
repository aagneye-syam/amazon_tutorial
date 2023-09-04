import 'package:amazon/constants/common_function.dart';
import 'package:amazon/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = '+91';
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/amazon_logo.png'),
          height: height * 0.04,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: textTheme.displaySmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              commonFuctions.blankSpace(
                height * 0.02,
                width * 0,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: greyShade3,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.06,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: greyShade3)),
                          color: greyShade1),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                inLogin = false;
                              });
                            },
                            child: Container(
                              height: height * 0.03,
                              width: height * 0.03,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: grey),
                                  color: white),
                              alignment: Alignment.center,
                              child: Icon(Icons.circle,
                                  size: height * 0.017,
                                  color:
                                      inLogin ? transparent : secondaryColor),
                            ),
                          ),
                          commonFuctions.blankSpace(0, width * 0.02),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Create account.',
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: ' New to Amazon?',
                                  style: textTheme.bodyMedium,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.01,
                      ),
                      child: Column(children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  inLogin = true;
                                });
                              },
                              child: Container(
                                height: height * 0.03,
                                width: height * 0.03,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: grey),
                                    color: white),
                                alignment: Alignment.center,
                                child: Icon(Icons.circle,
                                    size: height * 0.017,
                                    color:
                                        inLogin ? secondaryColor : transparent),
                              ),
                            ),
                            commonFuctions.blankSpace(0, width * 0.02),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Sign in.',
                                    style: textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: ' Already a customer?',
                                    style: textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        commonFuctions.blankSpace(
                          height * 0.01,
                          0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                showCountryPicker(
                                    context: context,
                                    onSelect: (val) {
                                      setState(() {
                                        currentCountryCode =
                                            '+${val.phoneCode}';
                                      });
                                    });
                              },
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: grey),
                                  color: greyShade1,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Text(
                                  currentCountryCode,
                                  style: textTheme.displayMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.06,
                              width: width * 0.64,
                              child: TextFormField(
                                controller: mobileController,
                                cursorColor: black,
                                style: textTheme.displaySmall,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Mobile number',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: grey,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: grey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: grey,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
