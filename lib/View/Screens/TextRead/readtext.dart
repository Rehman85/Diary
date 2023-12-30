import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:flutter/material.dart';

class ReadTextData extends StatelessWidget {
  String Taskname;
  String dueDate;
  String status;
  String data;
  Color col;
  bool bold;
  bool italic;
  bool underline;
  String Alignments;
  ReadTextData(
      {required this.Taskname,
      required this.dueDate,
      required this.status,
      required this.data,
      required this.col,
      required this.bold,
      required this.italic,
      required this.underline,
      required this.Alignments});
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic>? arguments =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CustamContainer(
                wigth: 48,
                hight: 48,
                // col: white,
                borders: true,
                bordercol: lightgray,
                cir: 10,
                child: Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
            Container(
              // color: yellow,
              width: 130,
              child: Center(
                child: Textcustam(
                  text: Taskname,
                  size: 20,
                  // col: col,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Textcustam(
                    text: 'Due Date',
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  Textcustam(
                    text: '${dueDate}',
                    col: gray,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Textcustam(
                text: status,
                col: col,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  linecon(col),
                  Container(
                    width: 300,
                    //  color: yellow,
                    child: Text(
                      textAlign: Alignments == 'justify'
                          ? TextAlign.justify
                          : Alignments == 'start'
                              ? TextAlign.start
                              : Alignments == 'center'
                                  ? TextAlign.center
                                  : TextAlign.end,
                      data,
                      style: TextStyle(
                          fontStyle:
                              italic ? FontStyle.italic : FontStyle.normal,
                          decoration: underline
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationColor: gray,
                          color: gray,
                          fontWeight:
                              bold == true ? FontWeight.w700 : FontWeight.w400),
                    ),
                    // 'Product management is a strategic role within a company that involves overseeing the development and management of a product or suite of products throughout their lifecycle. The primary goal of a product manager is to create and deliver products that meet customer needs, align with business objectives, and generate value for the organization.Market research and analysis: Product managers conduct market research to understand customer needs, preferences, and trends. They analyze market data and competitive landscape to identify opportunities and make informed product decisions.Product strategy: Product managers define the product vision, goals, and strategy based on market research and business objectivesI'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
