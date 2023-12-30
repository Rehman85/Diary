import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryData {
  String list;
  String status;
  String taskName;
  String noteData;
  Timestamp timestamp;
  String dueDate;
  bool bold;
  bool italic;
  bool underline;
  String Alignments;

  DiaryData(
      {required this.list,
      required this.status,
      required this.taskName,
      required this.noteData,
      required this.timestamp,
      required this.dueDate,
      required this.Alignments,
      required this.bold,
      required this.italic,
      required this.underline});

  Map<String, dynamic> toMap() => {
        "list": list,
        "status": status,
        "taskName": taskName,
        "noteData": noteData,
        "timestamp": timestamp,
        "dueDate": dueDate,
        "Alignments": Alignments,
        "bold": bold,
        "italic": italic,
        "underline": underline,
      };
  static DiaryData formsnap(DocumentSnapshot snap) {
    var snapshor = snap.data() as Map<String, dynamic>;
    return DiaryData(
      list: snapshor["list"],
      status: snapshor["status"],
      taskName: snapshor["taskName"],
      noteData: snapshor["noteData"],
      timestamp: snapshor["timestamp"],
      dueDate: snapshor["dueDate"],
      Alignments: snapshor["Alignments"],
      bold: snapshor["bold"],
      italic: snapshor["italic"],
      underline: snapshor["underline"],
    );
  }
}
