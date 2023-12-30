import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Model/DiaryModel/diarym.dart';
import 'package:diary/util/appCustam.dart';
import 'package:flutter/material.dart';

class NewNoteProviders extends ChangeNotifier {
  //  Text Edite

  bool _Texts = false;
  bool get Texts => _Texts;
  void Textscheck(bool value) {
    _Texts = value;

    _bold = false;
    _italic = false;
    _underline = false;
    _Alignmentss = 'left';
    notifyListeners();
  }

  bool _bold = false;
  bool get bold => _bold;
  void boldcheck(bool value) {
    _bold = value;
    // Textscheck(false);
    _Texts = false;
    notifyListeners();
  }

  bool _italic = false;
  bool get italic => _italic;
  void italicheck(bool value) {
    _italic = value;
    //Textscheck(false);
    _Texts = false;

    notifyListeners();
  }

  bool _underline = false;
  bool get underline => _underline;
  void underlinecheck(bool value) {
    _underline = value;
    //  Textscheck(false);
    _Texts = false;

    notifyListeners();
  }

  var _Alignmentss = "justify";
  String get Alignmentss => _Alignmentss;
  void aliment(String value) {
    _Alignmentss = value;
    // Textscheck(false);
    _Texts = false;

    notifyListeners();
  }

  // list List Dtata
  List Addas = ['Personal', 'Shopping', 'Wishlist', 'Work'];
  bool _check = false;
  bool get check => _check;
  int _indexno = -1;
  //  select index to  chose Addas list data
  int get indexno => _indexno;
  void selectindex(int value) {
    _indexno = value;
    notifyListeners();
  }

  void addcheck(bool value) {
    _check = value;
    notifyListeners();
  }

  ///
  //
  /// Status List Dtata
  ///
  List Statuss = ['Complete', 'Incomplete', 'Running', 'Upcoming'];
  List statusColour = [Completedcol, Incompletecol, Runningcol, Upcommingcol];
  bool _showstatus = false;
  bool get showstatus => _showstatus;
  int _statusIndex = -1;
  //  select index to  chose Addas list data
  int get statusIndex => _statusIndex;
  void statusSelectIndex(int value) {
    _statusIndex = value;
    notifyListeners();
  }

  void statusAddCheck(bool value) {
    _showstatus = value;
    notifyListeners();
  }

// Date Picker

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  Future<void> selectDate(
    BuildContext context,
  ) async {
    final DateTime? picked = await showDatePicker(
      //  barrierColor: yellow,
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setSelectedDate(picked);
    }
  }

  // String formatDate(DateTime date) {
  //   // Format the date as "yyyy / mm / dd"
  //   return '${date.year} / ${date.month.toString().padLeft(2, '0')} / ${date.day.toString().padLeft(2, '0')}';
  // }

  TextEditingController typenote = TextEditingController();
  TextEditingController taskname = TextEditingController();

// Add Diary

  void storeDiary(BuildContext context) async {
    var id = auth.currentUser!.uid;
    final Timestamp timestamps = Timestamp.now();

    DiaryData data = DiaryData(
      list: Addas[_indexno],
      status: Statuss[_statusIndex],
      noteData: typenote.text,
      taskName: taskname.text,
      timestamp: timestamps,
      dueDate:
          '${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}',
      Alignments: Alignmentss,
      bold: bold,
      italic: italic,
      underline: underline,
    );

    // var allDocs = await firestore.doc(id).collection('Diary').get();
    // int len = allDocs.docs.length;

    firestore.doc(id).collection("Diary").doc().set(data.toMap());
    typenote.text = '';
    taskname.text = '';
    addcheck(false);
    selectindex(-1);
    statusAddCheck(false);
    statusSelectIndex(-1);

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/HomeList', (Route<dynamic> route) => false);
  }
}
