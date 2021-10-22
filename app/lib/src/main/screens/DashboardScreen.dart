import 'package:app/src/main/utils/SideDrawerWidget.dart';
import 'package:app/shared/utils/AppWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:app/shared/utils/AppColors.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard', style: boldTextStyle(color: appTextColorPrimary)),
        ),
        drawer: SideDrawer(),
        body: Center(
         child: Container(
           padding: EdgeInsets.all(8),
           decoration: boxDecoration(showShadow: true),
           child: Image.asset('images/logo.png', height: 100),
         ),
        )
    );
  }
}

