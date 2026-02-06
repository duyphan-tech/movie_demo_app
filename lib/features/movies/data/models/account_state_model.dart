import 'package:movie_demo_app/features/movies/domain/entities/account_state.dart';

class AccountStateModel extends AccountState {
  AccountStateModel({
    required super.id,
    required super.favorite,
    required super.rating,
  });

  factory AccountStateModel.fromJson(Map<String, dynamic> json) {
    double? ratingValue;
    if (json['rated'] is Map) {
      ratingValue = (json['rated']['value'] as num).toDouble();
    }

    return AccountStateModel(
      id: json['id'],
      favorite: json['favorite'] ?? false,
      rating: ratingValue,
    );
  }
}
