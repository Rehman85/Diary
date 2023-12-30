import 'package:diary/Controller/AddNewNoteProvider/newnotecon.dart';
import 'package:diary/View/Screens/AddnewNote/widgets/appbartop.dart';
import 'package:diary/View/Screens/AddnewNote/widgets/editText.dart';
import 'package:diary/util/appCustam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnterNoteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewNoteProviders>(context, listen: false);
    return Scaffold(
        backgroundColor: white,
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(100.0),
        //   child: AppBar(
        //     backgroundColor: Colors.amber,
        //     automaticallyImplyLeading: false,
        //     title:  ),
        // ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Consumer<NewNoteProviders>(
                        builder: (context, value, child) => TextField(
                          textAlign: provider.Alignmentss == 'justify'
                              ? TextAlign.justify
                              : provider.Alignmentss == 'start'
                                  ? TextAlign.start
                                  : provider.Alignmentss == 'center'
                                      ? TextAlign.center
                                      : provider.Alignmentss == 'end'
                                          ? TextAlign.end
                                          : TextAlign.left,
                          style: TextStyle(
                            fontWeight: provider.bold
                                ? FontWeight.w700
                                : FontWeight.w400,
                            fontStyle: provider.italic
                                ? FontStyle.italic
                                : FontStyle.normal,
                            decoration: provider.underline
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            //  decorationColor: gray,
                          ),
                          controller: provider.typenote,
                          maxLines: 17,
                          autofocus: true,
                          cursorColor: yellow,
                          decoration: InputDecoration(
                            hintText: 'Typing Notes',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      EditTextx()
                    ],
                  ),
                ),
              ),
              //    color: yellow,
            ),
            AppBArTop(),
          ],
        ));
  }
}
