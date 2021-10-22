import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:app/shared/utils/AppWidget.dart';
import 'package:app/shared/utils/AppColors.dart';
import 'package:app/shared/utils/AppStyle.dart';
import 'package:app/shared/screens/ForgotPwdScreen.dart';
import 'package:app/src/main/screens/DashboardScreen.dart';
import 'package:app/shared/screens/RegisterScreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    changeStatusColor(appLayout_background);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appLayout_background,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      height: size.height * 0.3,
                      width: size.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: size.width,
                    decoration: boxDecorations(showShadow: true),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          cursorColor: appTextColorSecondary.withOpacity(0.2),
                          cursorWidth: 1,
                          autocorrect: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Username or Mobile number',
                            hintStyle: secondaryTextStyle(color: appTextColorSecondary.withOpacity(0.6)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
                          ),
                        ),
                        Divider(height: 1, thickness: 1),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                obscureText: true,
                                cursorColor: appTextColorSecondary.withOpacity(0.2),
                                cursorWidth: 1,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: secondaryTextStyle(color: appTextColorSecondary.withOpacity(0.6)),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ForgotPwdScreen().launch(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text('Forgot?', style: boldTextStyle(size: 14, color: appColorPrimary)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45),
                  SDButton(
                    textContent: "SIGN IN",
                    onPressed: () {
                      DashboardScreen().launch(context);
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Don\'t have an account?', style: secondaryTextStyle()),
                TextButton(
                  onPressed: () {
                    RegisterScreen().launch(context);
                  },
                  child: Text('REGISTER', style: boldTextStyle(size: 14, color: appColorPrimary)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
