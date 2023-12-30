// import 'package:diary/Controller/ProfileProvider/Profilecon.dart';
// import 'package:diary/util/appCustam.dart';
// import 'package:diary/util/custamWidget/custamContainer.dart';
// import 'package:diary/util/custamWidget/textcustam.dart';
// import 'package:diary/util/custamWidget/textfiledcustam.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProfileLists extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<ProfileProviders>(context, listen: false);

//     return Expanded(
//       child: StreamBuilder(
//         stream: firestore.doc(auth.currentUser!.uid).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data!.exists) {
//             final userData = snapshot.data!.data() as Map<String, dynamic>;
//             // Get Data
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               // Run after the build is complete
//               final provider =
//                   Provider.of<ProfileProviders>(context, listen: false);
//               provider.name.text = userData['name'] ?? "";
//               provider.email.text = userData['email'] ?? "";
//               provider.age.text = userData['age'] ?? "";
//               provider.phoneNo.text = userData['phoneNo'] ?? "";
//               provider.countrySelection = userData['country'] ?? "";
//               final gender = userData['gender'] ?? "";
//               provider.setSelectedGender(gender);
//             });
//             return Expanded(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   Textcustam(
//                     text: ' Fullname',
//                     size: 14,
//                     weight: FontWeight.w700,
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Textfiledcustam(
//                     controller: provider.name,
//                     height: 54,
//                     width: 350,
//                     hinttext: 'Name ',
//                   ),
//                   SizedBox(
//                     height: 24,
//                   ),
//                   Textcustam(
//                     text: ' Email',
//                     size: 14,
//                     weight: FontWeight.w700,
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Textfiledcustam(
//                     controller: provider.email,
//                     height: 54,
//                     width: 350,
//                     hinttext: 'mta.chughtai4@gmail.com',
//                   ),
//                   SizedBox(
//                     height: 24,
//                   ),
//                   Textcustam(
//                     text: ' Age',
//                     size: 14,
//                     weight: FontWeight.w700,
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Textfiledcustam(
//                     keyboardType: TextInputType.number,
//                     controller: provider.age,
//                     height: 54,
//                     width: 350,
//                     hinttext: '18',
//                   ),
//                   SizedBox(
//                     height: 24,
//                   ),
//                   Textcustam(
//                     text: ' Gender',
//                     size: 14,
//                     weight: FontWeight.w700,
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustamContainer(
//                         wigth: 150,
//                         hight: 54,
//                         borders: true,
//                         bordercol: lightgray,
//                         cir: 10,
//                         child: Row(
//                           // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(
//                               width: 18,
//                             ),
//                             Textcustam(text: 'Male'),
//                             SizedBox(
//                               width: 50,
//                             ),
//                             Consumer<ProfileProviders>(
//                               builder: (context, genderProvider, _) => Radio(
//                                 value: true,
//                                 groupValue: genderProvider.isMaleSelected,
//                                 activeColor: yellow,
//                                 onChanged: (value) {
//                                   genderProvider.setSelectedGender(value);
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       CustamContainer(
//                         wigth: 150,
//                         hight: 54,
//                         borders: true,
//                         bordercol: lightgray,
//                         cir: 10,
//                         child: Row(
//                           // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(
//                               width: 18,
//                             ),
//                             Textcustam(text: 'Female'),
//                             SizedBox(
//                               width: 30,
//                             ),
//                             Consumer<ProfileProviders>(
//                               builder: (context, genderProvider, _) => Radio(
//                                 value: false,
//                                 groupValue: genderProvider.isMaleSelected,
//                                 activeColor: yellow,
//                                 onChanged: (value) {
//                                   genderProvider.setSelectedGender(value);
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 24,
//                   ),
//                   Textcustam(
//                     text: ' Phone',
//                     size: 14,
//                     weight: FontWeight.w700,
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   CustamContainer(
//                     hight: 54,
//                     wigth: 352,
//                     borders: true,
//                     bordercol: lightgray,
//                     cir: 10,
//                     child: Row(
//                       children: [
//                         Stack(
//                           children: [
//                             Container(
//                                 width: 70,
//                                 child: provider.countrypic() //   color: yellow,
//                                 ),
//                             Positioned(
//                                 bottom: 13,
//                                 right: 0,
//                                 child: Icon(Icons.keyboard_arrow_down))
//                           ],
//                         ),
//                         Textcustam(
//                           text: '|',
//                           size: 30,
//                           weight: FontWeight.w300,
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                             child: TextField(
//                           controller: provider.phoneNo,
//                           keyboardType: TextInputType.number,
//                           cursorColor: yellow,
//                           decoration: InputDecoration(
//                             hintText: '619 3456 7890',
//                             border: InputBorder.none,
//                           ),
//                         ))
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 24,
//                   ),
//                 ],
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text("Error: ${snapshot.error}"),
//             );
//           }
//           return Center(
//             child: CircularProgressIndicator(
//               color: yellow,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:diary/Controller/ProfileProvider/Profilecon.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:diary/util/custamWidget/textfiledcustam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProviders>(context, listen: false);

    return FutureBuilder(
      future: firestore.doc(auth.currentUser!.uid).get(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Run after the build is complete
            final provider =
                Provider.of<ProfileProviders>(context, listen: false);
            provider.name.text = userData['name'] ?? "";
            provider.email.text = userData['email'] ?? "";
            provider.age.text = userData['age'] ?? "";
            provider.phoneNo.text = userData['phoneNo'] ?? "";
            provider.countrySelection = userData['country'] ?? "";
            final gender = userData['gender'] ?? "";
            provider.setSelectedGender(gender);
          });

          return Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Textcustam(
                  text: ' Fullname',
                  size: 14,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 6,
                ),
                Textfiledcustam(
                  controller: provider.name,
                  height: 54,
                  width: 350,
                  hinttext: 'Name ',
                ),
                // ... (rest of your UI code)
                SizedBox(
                  height: 24,
                ),
                Textcustam(
                  text: ' Email',
                  size: 14,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 8,
                ),
                Textfiledcustam(
                  controller: provider.email,
                  height: 54,
                  width: 350,
                  hinttext: 'mta.chughtai4@gmail.com',
                ),
                SizedBox(
                  height: 24,
                ),
                Textcustam(
                  text: ' Age',
                  size: 14,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 8,
                ),
                Textfiledcustam(
                  keyboardType: TextInputType.number,
                  controller: provider.age,
                  height: 54,
                  width: 350,
                  hinttext: '18',
                ),
                SizedBox(
                  height: 24,
                ),
                Textcustam(
                  text: ' Gender',
                  size: 14,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustamContainer(
                      wigth: 150,
                      hight: 54,
                      borders: true,
                      bordercol: lightgray,
                      cir: 10,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 18,
                          ),
                          Textcustam(text: 'Male'),
                          SizedBox(
                            width: 50,
                          ),
                          Consumer<ProfileProviders>(
                            builder: (context, genderProvider, _) => Radio(
                              value: true,
                              groupValue: genderProvider.isMaleSelected,
                              activeColor: yellow,
                              onChanged: (value) {
                                genderProvider.setSelectedGender(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustamContainer(
                      wigth: 150,
                      hight: 54,
                      borders: true,
                      bordercol: lightgray,
                      cir: 10,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 18,
                          ),
                          Textcustam(text: 'Female'),
                          SizedBox(
                            width: 30,
                          ),
                          Consumer<ProfileProviders>(
                            builder: (context, genderProvider, _) => Radio(
                              value: false,
                              groupValue: genderProvider.isMaleSelected,
                              activeColor: yellow,
                              onChanged: (value) {
                                genderProvider.setSelectedGender(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Textcustam(
                  text: ' Phone',
                  size: 14,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  height: 8,
                ),
                CustamContainer(
                  hight: 54,
                  wigth: 352,
                  borders: true,
                  bordercol: lightgray,
                  cir: 10,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 70,
                            child: provider.countrypic(),
                          ),
                          Positioned(
                            bottom: 13,
                            right: 0,
                            child: Icon(Icons.keyboard_arrow_down),
                          ),
                        ],
                      ),
                      Textcustam(
                        text: '|',
                        size: 30,
                        weight: FontWeight.w100,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: provider.phoneNo,
                          keyboardType: TextInputType.number,
                          cursorColor: yellow,
                          decoration: InputDecoration(
                            hintText: '619 3456 7890',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }
        return SizedBox(); // or return a loading indicator if needed
      },
    );
  }
}
