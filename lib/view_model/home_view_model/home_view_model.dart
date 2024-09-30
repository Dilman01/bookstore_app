import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bookstore_app/repositories/book_repository/provider/book_repository_provider.dart';
import 'package:bookstore_app/models/book_model/book_model.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  FutureOr<List<BookModel>> build() {
    return [];
  }

  Future<List<BookModel>> getBestDeals() async {
    return ref.watch(bookRepositoryProvider).getBestDeals();
  }

  Future<List<BookModel>> getTopBooks() async {
    return ref.watch(bookRepositoryProvider).getTopBooks();
  }

  Future<List<BookModel>> getLatestBooks() async {
    return ref.watch(bookRepositoryProvider).getLatestBooks();
  }

  Future<List<BookModel>> getUpcomingBooks() async {
    return ref.watch(bookRepositoryProvider).getUpcomingBooks();
  }
}
