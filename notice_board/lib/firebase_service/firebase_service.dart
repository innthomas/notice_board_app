import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notice_board/model/model.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
      FirestoreService._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirestoreService._internal();
  factory FirestoreService() {
    return _firestoreService;
  }
  Stream<List<News>> getNews() {
    return _db.collection('News').snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => News.fromMap(doc.data(), doc.id),
              )
              .toList(),
        );
  }

  Future<void> addNews(News news) {
    return _db.collection('News').add(news.toMap());
  }

  Future<void> deleteNews(String id) {
    return _db.collection('News').doc(id).delete();
  }

  Future<void> updateNews(News news) {
    return _db.collection('News').doc(news.id).update(news.toMap());
  }
}
