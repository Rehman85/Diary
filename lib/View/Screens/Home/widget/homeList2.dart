import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Controller/HomeProvider/homepovider.dart';
import 'package:diary/View/Screens/TextRead/readtext.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomeList2 extends StatelessWidget {
  var userid = auth.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("User")
          .doc(userid)
          .collection("Diary")
          .orderBy("timestamp", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return Expanded(
            child: Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: yellow,
                ),
              ),
            ),
          ); // Loading indicator or empty widget
        }

        final filterDose = snapshot.data!.docs.where((doc) {
          String Taskname = doc['taskName'];
          return provider.searchQuery.isEmpty ||
              (Taskname.toLowerCase()
                  .contains(provider.searchQuery.toLowerCase()));
        }).toList();

        return Expanded(
          child: MasonryGridView.builder(
            itemCount: filterDose.length, //snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              // String Taskname = snapshot.data!.docs[index]['taskName'];
              // String status = snapshot.data!.docs[index]["status"];
              // String dueDate = snapshot.data!.docs[index]["dueDate"];
              // String noteData = snapshot.data!.docs[index]["noteData"];
              // bool bold = snapshot.data!.docs[index]['bold'];
              // bool underline = snapshot.data!.docs[index]['underline'];
              // bool italic = snapshot.data!.docs[index]['italic'];
              // String Alignments = snapshot.data!.docs[index]['Alignments'];
              String Taskname = filterDose[index]['taskName'];
              String status = filterDose[index]["status"];
              String dueDate = filterDose[index]["dueDate"];
              String noteData = filterDose[index]["noteData"];
              bool bold = filterDose[index]['bold'];
              bool underline = filterDose[index]['underline'];
              bool italic = filterDose[index]['italic'];
              String Alignments = filterDose[index]['Alignments'];

              // Add Colours to List
              final Color col;
              status == 'Running'
                  ? col = Runningcol
                  : status == 'Upcoming'
                      ? col = Upcommingcol
                      : status == 'Incomplete'
                          ? col = Incompletecol
                          : col = Completedcol;

              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadTextData(
                            Taskname: Taskname,
                            dueDate: dueDate,
                            status: status,
                            data: noteData,
                            col: col,
                            bold: bold,
                            italic: italic,
                            underline: underline,
                            Alignments: Alignments,
                          ),
                        ));
                  },
                  child: CustamContainer(
                    wigth: 170,
                    //  height: 100,
                    borders: true,
                    bordercol: lightgray,
                    cir: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 9, right: 9, bottom: 9, top: 9),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Textcustam(
                              text: dueDate,
                              size: 9,
                              col: gray,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: linecon(col),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 110,
                                    //   color: yellow,
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      Taskname,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                      width: 120,
                                      //    color: yellow,
                                      child: Text(
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                        noteData,
                                        style: TextStyle(
                                            fontSize: 12, color: gray),
                                      ))
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Textcustam(
                              text: status,
                              size: 10,
                              weight: FontWeight.w600,
                              col: col,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        );

        // return Expanded(
        //   child: ListView.builder(
        //     itemCount: snapshot.data!.docs.length,
        //     itemBuilder: (context, index) {
        //       String Taskname = snapshot.data!.docs[index]['taskName'];
        //       String status = snapshot.data!.docs[index]["status"];
        //       String dueDate = snapshot.data!.docs[index]["dueDate"];
        //       String noteData = snapshot.data!.docs[index]["noteData"];

        //       // Add Colours to List
        //       final Color col;
        //       status == 'Running'
        //           ? col = Runningcol
        //           : status == 'Upcoming'
        //               ? col = Upcommingcol
        //               : status == 'Incomplete'
        //                   ? col = Incompletecol
        //                   : col = Completedcol;

        //       return Padding(
        //         padding: const EdgeInsets.only(bottom: 10),
        //         child: CustamContainer(
        //           wigth: 353,
        //           hight: 79,
        //           borders: true,
        //           cir: 10,
        //           bordercol: lightgray,
        //           child: Padding(
        //             padding: const EdgeInsets.only(left: 7, top: 7, bottom: 6),
        //             child: Row(
        //               children: [
        //                 linecon(col),
        //                 Padding(
        //                   padding: const EdgeInsets.only(
        //                     left: 12,
        //                   ),
        //                   child: Column(
        //                     children: [
        //                       Container(
        //                         width: 289,
        //                         child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             Container(
        //                               width: 145,
        //                               child: Text(
        //                                 maxLines: 1,
        //                                 overflow: TextOverflow.ellipsis,
        //                                 Taskname,
        //                                 style: TextStyle(
        //                                   fontSize: 14,
        //                                   fontWeight: FontWeight.w600,
        //                                 ),
        //                               ),
        //                             ),
        //                             Textcustam(
        //                               text: dueDate,
        //                               size: 10,
        //                               col: gray,
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                       Container(
        //                         width: 289,
        //                         height: 30,
        //                         child: Text(
        //                           maxLines: 2,
        //                           overflow: TextOverflow.ellipsis,
        //                           noteData,
        //                           style: TextStyle(fontSize: 12, color: gray),
        //                         ),
        //                       ),
        //                       Container(
        //                         width: 289,
        //                         child: Align(
        //                           alignment: Alignment.topRight,
        //                           child: Textcustam(
        //                             text: status,
        //                             size: 10,
        //                             weight: FontWeight.w500,
        //                             col: col,
        //                           ),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // );
      },
    );
  }
}
