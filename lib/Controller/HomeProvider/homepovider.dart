import 'package:diary/Controller/AddNewNoteProvider/newnotecon.dart';
import 'package:diary/View/Screens/AddnewNote/widgets/DropDown/dropDonList.dart';
import 'package:diary/View/Screens/AddnewNote/widgets/DropDown/dropdownStats.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/Buttoncustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeController extends ChangeNotifier {
  bool _listshow = true;
  bool get listshow => _listshow;
  void setlist(bool value) {
    _listshow = value;
    notifyListeners();
  }

// Search  Values

  TextEditingController searchcontroller = TextEditingController();
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void query(var value) {
    _searchQuery = value;
    notifyListeners();
  }

  // List<HomeListModel> notes = [
  //   HomeListModel(
  //       date: 'Mon, Dec 11, 2023 03:30 PM',
  //       sending: 'Running',
  //       text:
  //           'Lorem ipsum dolor sit amet consectetur. Auctor enim lorem pharetra sed integer et.',
  //       title: 'Meeting'),
  //   HomeListModel(
  //       date: 'Mon, Dec 11, 2023 03:30 PM',
  //       sending: 'Upcomming',
  //       text:
  //           'Lorem ipsum dolor sit amet consectetur. Auctor enim lorem pharetra sed integer et.',
  //       title: 'Office Work'),
  //   HomeListModel(
  //       date: 'Mon, Dec 11, 2023 03:30 PM',
  //       sending: 'Incomplete',
  //       text:
  //           'Lorem ipsum dolor sit amet consectetur. Auctor enim lorem pharetra sed integer et.',
  //       title: 'Research Work'),
  //   HomeListModel(
  //       date: '2 Days',
  //       sending: 'Completed',
  //       text:
  //           'Lorem ipsum dolor sit amet consectetur. Auctor enim lorem pharetra sed integer et.',
  //       title: 'Books purchase'),
  //   HomeListModel(
  //       date: '6 hours',
  //       sending: 'Completed',
  //       text:
  //           'Lorem ipsum dolor sit amet consectetur. Auctor enim lorem pharetra sed integer et.',
  //       title: 'Home Work'),
  //   // HomeListModel(
  //   //     date: '6 hours',
  //   //     sending: 'Completed',
  //   //     text:
  //   //         'Lorem ipsum dolor sit amet consectetur. Auctor enim lorem pharetra sed integer et.',
  //   //     title: 'Home Work')
  // ];

  void showbottomsheet(BuildContext context) {
    final provider = Provider.of<NewNoteProviders>(context, listen: false);

    showModalBottomSheet(
      backgroundColor: white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: white,
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CustamContainer(
                      wigth: 142,
                      hight: 5,
                      col: lightgray,
                      cir: 5,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Textcustam(
                    text: ' List',
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Consumer<NewNoteProviders>(
                    builder: (context, value, child) => GestureDetector(
                      onTap: () {
                        if (value.check == true) {
                          value.addcheck(false);
                        } else {
                          provider.statusAddCheck(false);
                          value.addcheck(true);
                        }
                      },
                      child: CustamContainer(
                        wigth: 350,
                        hight: 50,
                        bordercol: lightgray,
                        borders: true,
                        cir: 7,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Textcustam(
                                text: value.indexno == -1
                                    ? 'Default'
                                    : value.Addas[value.indexno],
                                col: value.indexno == -1 ? gray : black,
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Consumer<NewNoteProviders>(
                    builder: (context, value, child) => value.check == true
                        ? Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              DropDownList(),
                            ],
                          )
                        : SizedBox(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Textcustam(
                    text: ' Status',
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (provider.showstatus == true) {
                        provider.statusAddCheck(false);
                      } else {
                        provider.addcheck(false);
                        provider.statusAddCheck(true);
                      }
                    },
                    child: CustamContainer(
                      wigth: 350,
                      hight: 50,
                      bordercol: lightgray,
                      borders: true,
                      cir: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<NewNoteProviders>(
                              builder: (context, value, child) => Textcustam(
                                  text: value.statusIndex == -1
                                      ? 'Default'
                                      : value.Statuss[value.statusIndex],
                                  col: value.statusIndex == -1
                                      ? gray
                                      : value.statusColour[value.statusIndex]),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Consumer<NewNoteProviders>(
                    builder: (context, value, child) => value.showstatus == true
                        ? Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              DropDownStatus(),
                            ],
                          )
                        : SizedBox(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RoundButton(
                          title: 'Clear',
                          backcol: Color(0xffF9F9F9),
                          fun: () {
                            provider.addcheck(false);
                            provider.selectindex(-1);
                            provider.statusAddCheck(false);
                            provider.statusSelectIndex(-1);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: RoundButton(
                          title: 'Go',
                          fun: () {
                            provider.addcheck(false);
                            if (provider.statusIndex != -1 &&
                                provider.indexno != -1) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/AddNewNodes');
                            } else {}
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

//
}
