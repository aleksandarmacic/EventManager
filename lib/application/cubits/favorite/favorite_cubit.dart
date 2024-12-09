import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit(bool isFavorite) : super(isFavorite);

  void toggleFavorite() {
    emit(!state);
  }
}