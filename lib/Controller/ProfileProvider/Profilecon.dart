import 'package:country_code_picker/country_code_picker.dart';
import 'package:diary/util/appCustam.dart';
import 'package:flutter/material.dart';

class ProfileProviders extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phoneNo = TextEditingController();

  bool _isMaleSelected = true;

  bool get isMaleSelected => _isMaleSelected;

  void setSelectedGender(var isMale) {
    _isMaleSelected = isMale;
    notifyListeners();
  }

  String countrySelection = 'us';
  // String get countrySelection => _countrySelection;
  // void initialSelectioncountry(String value)
  // {

  // }

  Widget countrypic() {
    return CountryCodePicker(
      onChanged: (CountryCode? country) {
        countrySelection = country!.code!;
      },
      initialSelection: countrySelection,
      //  favorite: ['+1', 'us'],
      showCountryOnly: true,
      showFlagMain: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
    );
  }

  void UpdateProfile() {
    firestore.doc(auth.currentUser!.uid).update({
      'name': name.text,
      'email': email.text,
      'age': age.text,
      'gender': _isMaleSelected,
      'phoneNo': phoneNo.text,
      'country': countrySelection
    });
  }
}
