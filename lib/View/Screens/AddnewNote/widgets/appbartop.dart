import 'package:diary/Controller/AddNewNoteProvider/newnotecon.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBArTop extends StatelessWidget {
  const AppBArTop({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewNoteProviders>(context, listen: false);

    return Container(
      // color: Colors.green,
      height: 200,
      width: double.infinity,
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CustamContainer(
                    wigth: 48,
                    hight: 48,
                    borders: true,
                    bordercol: lightgray,
                    cir: 10,
                    child: Icon(
                      Icons.arrow_back_ios_new,

                      size: 20,
                      //  color: gray,
                    ),
                  ),
                ),
                Textcustam(
                  text: 'New Note',
                  size: 20,
                  weight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () {
                    provider.storeDiary(context);
                  },
                  child: Textcustam(
                    text: 'save',
                    size: 20,
                    weight: FontWeight.w500,
                    col: yellow,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            color: lightgray,
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Textcustam(
              text: 'Product Management',
              size: 20,
              weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
