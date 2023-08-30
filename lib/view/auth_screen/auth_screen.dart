import 'package:amazon/constants/common_function.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;

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
                          Container(
                            height: height * 0.03,
                            width: height * 0.03,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: grey),
                                color: white),
                            alignment: Alignment.center,
                            child: Icon(Icons.circle,
                                size: height * 0.017,
                                color: !inLogin ? transparent : secondaryColor),
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
