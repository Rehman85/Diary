import 'package:diary/Controller/AddNewNoteProvider/newnotecon.dart';
import 'package:diary/Controller/HomeProvider/homepovider.dart';
import 'package:diary/View/Screens/Home/widget/drawers.dart';
import 'package:diary/View/Screens/Home/widget/homeList1.dart';
import 'package:diary/View/Screens/Home/widget/homeList2.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/Buttoncustam.dart';
import 'package:diary/util/custamWidget/Textcustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    // Note List
    final notepro = Provider.of<NewNoteProviders>(context, listen: false);

    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (BuildContext context) => GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: CustamContainer(
                          wigth: 48,
                          hight: 48,
                          borders: true,
                          bordercol: lightgray,
                          cir: 10,
                          child: Icon(
                            Icons.menu,
                            size: 30,
                            color: gray,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Textcustam(
                      text: 'Notes',
                      size: 20,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        provider.setlist(false);
                      },
                      child: CustamContainer(
                        wigth: 48,
                        hight: 48,
                        borders: true,
                        bordercol: lightgray,
                        cir: 10,
                        child: SvgPicture.asset(Images.Menu),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.setlist(true);
                      },
                      child: CustamContainer(
                        wigth: 48,
                        hight: 48,
                        borders: true,
                        bordercol: lightgray,
                        cir: 10,
                        child: SvgPicture.asset(Images.filter),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            CustamContainer(
                wigth: 353,
                hight: 48,
                bordercol: lightgray,
                borders: true,
                cir: 10,
                child: Consumer<HomeController>(
                  builder: (context, value, child) => TextField(
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    cursorColor: yellow,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: gray),
                      hintText: 'Search something here',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 24, right: 10),
                        child: Container(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset(
                            Images.searchicon,
                            height: 24,
                            width: 24,
                            color: gray,
                          ),
                        ),
                      ),
                    ),
                    onChanged: (newvalue) {
                      value.query(newvalue);
                    },
                  ),
                )

                //    Textfiledcustam(
                //   height: 48,
                //   width: 353,
                //   starticon: Padding(
                //     padding: const EdgeInsets.only(
                //         top: 12, bottom: 12, left: 24, right: 8),
                //     child: Container(
                //       height: 24,
                //       width: 24,
                //       //color: Colors.amber,
                //       child: SvgPicture.asset(
                //         Images.searchicon,
                //         height: 24,
                //         width: 24,
                //       ),
                //     ),
                //   ),
                //   hinttext: 'Search something here',
                // ),

                ),
            Consumer<HomeController>(
              builder: (context, value, child) =>
                  value.listshow == true ? HomeList1() : HomeList2(),
            ),
            RoundButton(
              title: 'Add New Note',
              fun: () {
                notepro.addcheck(false);
                notepro.statusAddCheck(false);

                provider.showbottomsheet(context);
                // Navigator.pushNamed(context, '/AddNewNodes');
              },
            ),
            SizedBox(
              height: 18,
            )
          ],
        ),
      ),
    );
  }
}
