import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState({
    required int id,
    required bool favorite,
    double? rating,
  }) = _AccountState;
}
