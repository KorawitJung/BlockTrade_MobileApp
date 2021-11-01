import 'package:blocktrade/all_sign_form/splash/splash_screen.dart';
import 'package:blocktrade/screen/MorePage/contact_us_page.dart';
import 'package:blocktrade/screen/MorePage/languagepage.dart';
import 'package:blocktrade/screen/MorePage/privacy_policy_page.dart';
import 'package:blocktrade/store.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);

    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  store1.h10.tr(),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          More_Form(),
        ],
      ),
    );
  } //ef

} //ec

class More_Form extends StatelessWidget {
  const More_Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 20),
      width: MediaQuery.of(context).size.width,
      height: 350,
      child: Column(
        children: [
          MoreForm(),
        ],
      ),
    );
  }
} //ec

class SettingItem {
  final String title;
  final IconData icon;
//don't forget to add const
  const SettingItem({
    required this.title,
    required this.icon,
  });
} //ec

class SettingItems {
  static const languageSettingsBox = SettingItem(
    title: 'Language Settings',
    icon: Icons.language,
  );
  static const contactUsBox = SettingItem(
    title: 'Contact Us',
    icon: Icons.call,
  );
  static const privacyPolicyBox = SettingItem(
    title: 'Privacy Policy',
    icon: Icons.remove_red_eye,
  );
  static const logoutBox = SettingItem(
    title: 'Sign Out',
    icon: Icons.logout,
  );

  static final List<SettingItem> all = [
    languageSettingsBox,
    contactUsBox,
    privacyPolicyBox,
    logoutBox,
  ];
} //ec

class MoreForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Store store1 = Provider.of<Store>(context);
    return Column(
      children: SettingItems.all.map((item) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
              decoration: BoxDecoration(
                color: Color(0xFF687A86),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 0.4),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                leading: Icon(item.icon, color: Colors.white),
                title: Text(
                  item.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  switch (item) {
                    case SettingItems.languageSettingsBox:
                      //open the switching language page
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) {
                            return LanguageSetupPage();
                          },
                        ),
                      );
                      break;
                    case SettingItems.contactUsBox:
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return ContactUsPage();
                          },
                        ),
                      );
                      break;
                    case SettingItems.privacyPolicyBox:
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return PrivacyPolicyPage();
                          },
                        ),
                      );
                      break;
                    case SettingItems.logoutBox:
                      store1.logout();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Sign out . . .'),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                      store1.logout();
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            store1.logout();
                            return SplashScreen();
                          },
                        ),
                      );
                  }
                },
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
