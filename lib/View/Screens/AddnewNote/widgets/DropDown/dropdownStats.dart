import 'package:diary/Controller/AddNewNoteProvider/newnotecon.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<NewNoteProviders>(context, listen: false);

    return Container(
      height: 205,
      width: 320,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 9),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 9),
              child: GestureDetector(
                onTap: () {
                  value.statusSelectIndex(index);
                  value.statusAddCheck(false);
                },
                child: Container(
                  width: double.infinity,
                  // color: Colors.amber,
                  height: 42,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textcustam(
                        text: value.Statuss[index],
                        weight: FontWeight.w500,
                        col: value.statusColour[index],
                        size: 12,
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Divider(
                        color: lightgray,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
