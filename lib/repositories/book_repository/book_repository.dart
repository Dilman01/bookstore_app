import 'dart:convert';
import 'package:bookstore_app/models/book_model/book_model.dart';
import 'package:flutter/services.dart';

class BookRepository {
  Future<List<BookModel>> fetchBooks() async {
    await Future.delayed(const Duration(seconds: 1));

    final String response = await rootBundle.loadString('assets/books.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => BookModel.fromJson(json)).toList();
  }

  Future<List<BookModel>> getBestDeals() async {
    final List<BookModel> books = await fetchBooks();
    return books.where((book) => book.isBestDeal).toList();
  }

  Future<List<BookModel>> getTopBooks() async {
    final List<BookModel> books = await fetchBooks();
    return books.where((book) => book.isTopBook).toList();
  }

  Future<List<BookModel>> getLatestBooks() async {
    final List<BookModel> books = await fetchBooks();
    return books.where((book) => book.isLatestBook).toList();
  }

  Future<List<BookModel>> getUpcomingBooks() async {
    final List<BookModel> books = await fetchBooks();
    return books.where((book) => book.isUpcomingBook).toList();
  }

  Future<List<BookModel>> getBooksByCategory(String category) async {
    final List<BookModel> books = await fetchBooks();

    return books
        .where(
          (book) => book.category.toLowerCase() == category.toLowerCase(),
        )
        .toList();
  }
}
