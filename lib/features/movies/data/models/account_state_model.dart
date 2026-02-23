import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/account_state.dart';

part 'account_state_model.freezed.dart';

@freezed
abstract class AccountStateModel with _$AccountStateModel {
  const AccountStateModel._();

  const factory AccountStateModel({
    required int id,
    required bool favorite,
    double? rating,
  }) = _AccountStateModel;

  factory AccountStateModel.fromJson(Map<String, dynamic> json) {
    double? ratingValue;
    if (json['rated'] is Map) {
      ratingValue = (json['rated']['value'] as num).toDouble();
    }

    return AccountStateModel(
      id: json['id'] as int,
      favorite: json['favorite'] as bool? ?? false,
      rating: ratingValue,
    );
  }
}

extension AccountStateModelX on AccountStateModel {
  AccountState toDomain() {
    return AccountState(
      id: id,
      favorite: favorite,
      rating: rating,
    );
  }
}
