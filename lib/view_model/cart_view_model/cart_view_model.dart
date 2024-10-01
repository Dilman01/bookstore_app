import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:bookstore_app/models/book_model/book_model.dart';

part 'cart_view_model.g.dart';

@riverpod
class CartViewModel extends _$CartViewModel {
  @override
  List<BookModel> build() {
    return [];
  }

  void addToCart(BookModel book) {
    state = [...state, book];
  }

  void deleteFromCart(BookModel book) {
    state = state
        .where(
          (element) => element.id != book.id,
        )
        .toList();
  }
}
