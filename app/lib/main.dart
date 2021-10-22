//region imports
import 'package:app/shared/utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app/shared/store/AppStore.dart';
import 'package:app/shared/utils/AppTheme.dart';
import 'package:app/shared/screens/SplashScreen.dart';
import 'package:nb_utils/nb_utils.dart';
//endregion

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

void main() async {
 // appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,

      ),
    );
  }
}
