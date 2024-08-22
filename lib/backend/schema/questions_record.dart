import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "correctOption" field.
  String? _correctOption;
  String get correctOption => _correctOption ?? '';
  bool hasCorrectOption() => _correctOption != null;

  // "questionNUm" field.
  int? _questionNUm;
  int get questionNUm => _questionNUm ?? 0;
  bool hasQuestionNUm() => _questionNUm != null;

  // "AnswerOptions" field.
  List<String>? _answerOptions;
  List<String> get answerOptions => _answerOptions ?? const [];
  bool hasAnswerOptions() => _answerOptions != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _correctOption = snapshotData['correctOption'] as String?;
    _questionNUm = castToType<int>(snapshotData['questionNUm']);
    _answerOptions = getDataList(snapshotData['AnswerOptions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  String? question,
  String? correctOption,
  int? questionNUm,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'correctOption': correctOption,
      'questionNUm': questionNUm,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        e1?.correctOption == e2?.correctOption &&
        e1?.questionNUm == e2?.questionNUm &&
        listEquality.equals(e1?.answerOptions, e2?.answerOptions);
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality()
      .hash([e?.question, e?.correctOption, e?.questionNUm, e?.answerOptions]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
