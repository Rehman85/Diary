import 'package:diary/Model/onboardmodel.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';

class OnBboardingProviders extends ChangeNotifier {
  ///Splish How TO Move Screen

  PageController pagecon = PageController();

  List<ModelOnboard> pagelist = [
    ModelOnboard(
        data: 'Take Notes',
        image: Images.onboard2,
        text: 'Quickly capture what’s on your mind'),
    ModelOnboard(
        data: 'To-dos ',
        image: Images.onboard1,
        text: 'List out your day-to-day tasks')
  ];
}
