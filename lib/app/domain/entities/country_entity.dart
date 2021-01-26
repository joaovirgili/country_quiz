import 'package:equatable/equatable.dart';

class CountryEntity implements Equatable {
  CountryEntity({
    this.flag,
    this.name,
    this.capital,
    this.code,
  });

  final String flag;
  final String name;
  final String capital;
  final String code;

  @override
  List<Object> get props => [code];

  @override
  bool get stringify => throw UnimplementedError();
}
