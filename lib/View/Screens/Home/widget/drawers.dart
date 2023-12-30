import 'package:diary/Controller/HomeProvider/drawersProvider.dart';
import 'package:diary/FirbaseData/firbaseText.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:diary/Controller/ProfileProvider/Profilecon.dart';

class DrawerWidget extends StatelessWidget {
  final uidcurrent = auth.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProviders>(context, listen: false);

    final provider = Provider.of<DrawersProviders>(context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: yellow,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Images.Frame,
                        height: 28,
                        width: 28,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Textcustam(
                        text: 'TO DO',
                        size: 20,
                        col: white,
                        weight: FontWeight.w700,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  ListTile(
                      leading: FutureBuilder<String>(
                          future: fetchUser('profilePhoto', uidcurrent),
                          builder: (context, snapshot) {
                            return snapshot.data != null && snapshot.data != ''
                                ? Container(
                                    height: 72,
                                    width: 72,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: yellow,
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot.data ??
                                                ''), //AssetImage(Images.Profilepic),
                                            fit: BoxFit.cover)))
                                : Container(
                                    height: 72,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: lightgray,
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      color: gray,
                                      size: 30,
                                    ),
                                  );
                          }),
                      title: GetTextData(
                        fieldd: 'name',
                        textFontSize: 18,
                        col: white,
                        fontWeight: FontWeight.w700,
                      ),
                      subtitle: GetTextData(
                        fieldd: 'email',
                        textFontSize: 11,
                        col: white,
                        // fontWeight: FontWeight.w700,
                      ))
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 19,
                ),
                DrawerCustamcon(
                  data: 'Profile',
                  icons: Images.profileicon,
                  fun: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, '/ProfileScreen');
                  },
                ),
                DrawerCustamcon(
                  data: 'Help & FAQ',
                  icons: Images.helpIcon,
                  fun: () {},
                ),
                DrawerCustamcon(
                  data: 'Rate Us',
                  icons: Images.Star,
                  fun: () {},
                ),
                DrawerCustamcon(
                  data: 'Share',
                  icons: Images.shar,
                  fun: () {},
                ),
                DrawerCustamcon(
                  data: 'Logout',
                  icons: Images.Exit,
                  fun: () {
                    provider.logoutfun(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerCustamcon extends StatelessWidget {
  final String data;
  final String icons;
  final VoidCallback fun;
  DrawerCustamcon({required this.data, required this.icons, required this.fun});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: fun,
          child: CustamContainer(
              wigth: 268,
              hight: 49,
              borders: true,
              bordercol: lightgray,
              cir: 5,
              child: Row(
                children: [
                  SizedBox(
                    width: 19,
                  ),
                  SvgPicture.asset(icons),
                  SizedBox(
                    width: 14,
                  ),
                  Textcustam(
                    text: data,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
