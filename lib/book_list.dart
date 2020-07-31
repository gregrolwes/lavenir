import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  String book = "My BookButts";
  String author = "";

  _BookListState() {
    Firestore.instance
        .collection('books')
        .where("title", isEqualTo: book)
        .snapshots()
        .listen(
            (data) => data.documents.forEach((doc) => author = doc['author']));
  }

  @override
  Widget build(BuildContext context) {
    return new Text(author);
  }
}
