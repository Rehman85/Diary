import 'package:diary/Controller/AddNewNoteProvider/newnotecon.dart';
import 'package:diary/View/Screens/AddnewNote/widgets/DropDown/dropDonList.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/Buttoncustam.dart';
import 'package:diary/util/custamWidget/Textcustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/textfiledcustam.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AddNewNodes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewNoteProviders>(context, listen: false);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustamContainer(
                      wigth: 48,
                      hight: 48,
                      col: white,
                      borders: true,
                      bordercol: lightgray,
                      cir: 10,
                      child: Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                  Textcustam(
                    text: 'New Note',
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Textcustam(
                text: '  Task Name',
                size: 14,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 6,
              ),
              Textfiledcustam(
                controller: provider.taskname,
                hinttext: 'Enter Task Here',
                height: 50,
                width: 350,
              ),
              SizedBox(
                height: 24,
              ),
              Textcustam(
                text: '  Due Date',
                size: 14,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 6,
              ),
              CustamContainer(
                wigth: 350,
                hight: 50,
                borders: true,
                cir: 10,
                bordercol: lightgray,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<NewNoteProviders>(
                        builder: (context, value, child) => Textcustam(
                          text:
                              '${provider.selectedDate.day.toString().padLeft(2, '0')}/${provider.selectedDate.month.toString().padLeft(2, '0')}/${provider.selectedDate.year}',
                          //'dd / mm / yyyy',
                          col: gray,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.selectDate(context);
                        },
                        child: SvgPicture.asset(
                          Images.Calendar,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textcustam(
                    text: '  Add As',
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  Textcustam(
                    text: 'Add New  ',
                    col: gray,
                    weight: FontWeight.w500,
                  )
                ],
              ),
              SizedBox(
                height: 6,
              ),
              GestureDetector(
                onTap: () {
                  if (provider.check == true) {
                    provider.addcheck(false);
                  } else {
                    provider.addcheck(true);
                  }
                },
                child: CustamContainer(
                  wigth: 350,
                  hight: 50,
                  borders: true,
                  cir: 10,
                  bordercol: lightgray,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<NewNoteProviders>(
                          builder: (context, value, child) => Textcustam(
                            text: value.indexno == -1
                                ? 'Default'
                                : value.Addas[value.indexno],
                            col: gray,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<NewNoteProviders>(
                builder: (context, value, child) => value.check == true
                    ? DropDownList()
                    : SizedBox(
                        height: 205,
                      ),
              ),
              SizedBox(
                height: 50,
              ),
              RoundButton(
                title: 'Next',
                fun: () {
                  if (provider.taskname.text != '') {
                    Navigator.pushNamed(context, '/EnterNoteText');
                  } else {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
