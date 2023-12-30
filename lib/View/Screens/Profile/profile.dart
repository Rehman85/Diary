import 'package:diary/Controller/ProfileProvider/Profilecon.dart';
import 'package:diary/Controller/ProfileProvider/imageEdit.dart';
import 'package:diary/FirbaseData/firbaseImage.dart';
import 'package:diary/View/Screens/Profile/widgets/profileList.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/Buttoncustam.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProviders>(context, listen: false);
    final changepoto = Provider.of<ChangeProfilePoto>(context, listen: false);
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
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
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: black,
                  ),
                ),
                Textcustam(
                  text: 'Profile',
                  size: 20,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Stack(
              children: [
                Container(
                  height: 110,
                  width: 92,
                  //    color: Colors.green,
                ),
                // FutureBuilder<String>(
                //     future: fetchUser('profilePhoto', currentUid),
                //     builder: (context, snapshot) {
                //       return snapshot.data != null && snapshot.data != ''
                //           ? Container(
                //               height: 92,
                //               width: 92,
                //               decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   color: lightgray,
                //                   image: DecorationImage(
                //                       image: NetworkImage(snapshot.data ??
                //                           ''), //AssetImage(Images.Profilepic),
                //                       fit: BoxFit.cover)))
                //           : Container(
                //               height: 92,
                //               width: 92,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: lightgray,
                //               ),
                //               child: Icon(
                //                 Icons.person,
                //                 size: 30,
                //               ),
                //             );
                //     }),
                GetImageData(
                  height: 92,
                  width: 92,
                ),
                Positioned(
                    bottom: 2,
                    left: 30,
                    right: 20,
                    child: GestureDetector(
                        onTap: () {
                          changepoto.coverpic(ImageSource.gallery);
                        },
                        child: SvgPicture.asset(Images.camaricon))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ProfileLists(),
            RoundButton(
              title: 'Save',
              textcolor: white,
              fun: () {
                provider.UpdateProfile();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/HomeList', (route) => false);
              },
              backcol: black,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
