import 'package:diary/Controller/AddNewNoteProvider/newnotecon.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/imageontab.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTextx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewNoteProviders>(context, listen: false);

    return Consumer<NewNoteProviders>(
      builder: (context, value, child) => CustamContainer(
        wigth: 353,
        hight: 57,
        col: yellow,
        cir: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Imageontab(
                fun: () {
                  if (provider.bold == true) {
                    provider.boldcheck(false);
                  } else {
                    provider.boldcheck(true);
                  }
                },
                image: Images.textbold,
                col: provider.bold ? white : black,
              ),
              Imageontab(
                fun: () {
                  if (provider.italic == true) {
                    provider.italicheck(false);
                  } else {
                    provider.italicheck(true);
                  }
                },
                image: Images.textitalic,
                col: provider.italic ? white : black,
              ),
              Imageontab(
                fun: () {
                  if (provider.underline == true) {
                    provider.underlinecheck(false);
                  } else {
                    provider.underlinecheck(true);
                  }
                },
                image: Images.textunderline,
                col: provider.underline ? white : black,
              ),
              Imageontab(
                fun: () {
                  if (provider.Texts == true) {
                    provider.Textscheck(false);
                  } else {
                    provider.Textscheck(true);
                  }
                },
                image: Images.text,
                col: provider.Texts ? white : black,
              ),
              Imageontab(
                fun: () {
                  provider.aliment('justify');
                },
                image: Images.textali,
                col: provider.Alignmentss == 'justify' ? white : black,
              ),
              Imageontab(
                fun: () {
                  provider.aliment('start');
                },
                image: Images.aligncenter,
                col: provider.Alignmentss == 'start' ? white : black,
              ),
              Imageontab(
                fun: () {
                  provider.aliment('center');
                },
                image: Images.textaligncenter,
                col: provider.Alignmentss == 'center' ? white : black,
              ),
              Imageontab(
                fun: () {
                  provider.aliment('end');
                },
                image: Images.alignRight,
                col: provider.Alignmentss == 'end' ? white : black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
