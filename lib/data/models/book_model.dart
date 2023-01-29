import 'package:flutter/material.dart';

class BookModel with ChangeNotifier {
  String? id;
  String? title;
  String? description;
  bool isAvailable;
  String? coverImage;
  String? category;
  int? phoneNumber;
  String? location;

  BookModel(
      {this.id,
      this.title,
      this.description,
      this.isAvailable = true,
      this.coverImage,
      this.category,
      this.phoneNumber,
      this.location});
}
