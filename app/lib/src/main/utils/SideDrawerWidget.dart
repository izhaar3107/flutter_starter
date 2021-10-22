import 'package:app/shared/screens/LoginScreen.dart';
import 'package:app/src/main/screens/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:app/src/main/model/SideDrawerModel.dart';


class SideDrawer extends StatefulWidget {
  static String tag = '/SideDrawer';

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  List<DrawerModel> getDrawerList = _getDrawerList();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ClipPath(
        clipper: OvalRightBorderClipper(),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           UserAccountsDrawerHeader(
              margin: EdgeInsets.all(0),
              accountName: Text('John Dae', style: boldTextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/userpic.jpeg'),
                radius: 40,
              ),
              accountEmail: Text('johadae@johadae.com'),
            ),
            10.height,
            Container(
              child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: getDrawerList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: getDrawerList[index].isSelected ? Colors.blueGrey.withOpacity(0.3) : transparentColor,
                      child: createBasicListTile(
                        text: getDrawerList[index].title!,
                        icon: getDrawerList[index].icon,
                        onTap: () {
                          if (currentIndex == index) {
                            finish(context);
                          } else {
                            currentIndex = index;
                            if (getDrawerList[index].title != "Setting" && getDrawerList[index].title != "Upgrade Account") {
                              getDrawerList.forEach((element) {
                                element.isSelected = false;
                              });
                            }
                            getDrawerList[index].isSelected = true;
                            getDrawerList.elementAt(getDrawerList.length - 1).isSelected = false;
                            getDrawerList.elementAt(getDrawerList.length - 2).isSelected = false;

                            finish(context);
                            // if (getDrawerList[index].title != "Setting" && getDrawerList[index].title != "Upgrade Account") {
                            //   getDrawerList[index].goto.launch(context, isNewTask: true);
                            // } else {
                            //   getDrawerList[index].goto.launch(context);
                            // }
                            getDrawerList[index].goto.launch(context);
                          }
                        },
                      ).paddingSymmetric(horizontal: 16),
                    );
                  }),
            ),
          ],
        ),
      ),
    ),
        ),
    );
  }


}
List<DrawerModel> _getDrawerList() {
  List<DrawerModel> _drawerModel = [];
  _drawerModel.add(DrawerModel(title: "Dashboard", icon: Icons.home, goto: DashboardScreen()));
  _drawerModel.add(DrawerModel(title: "Login", icon: Icons.verified_user, goto: LoginScreen()));
  //_drawerModel.add(DrawerModel(title: "Files", icon: Icons.folder, goto: CSCommonFileComponents(appBarTitle: CSAppName)));

  return _drawerModel;
}


