import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
class BookModel with _$BookModel {
  const factory BookModel({
    required String id,
    required String title,
    required String description,
    required String author,
    required String imageUrl,
    required String category,
    required double rating,
    required double price,
    String? discount,
    int? amount,
    required bool isBestDeal,
    required bool isTopBook,
    required bool isLatestBook,
    required bool isUpcomingBook,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
}
