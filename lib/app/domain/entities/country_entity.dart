import 'package:equatable/equatable.dart';

class CountryEntity implements Equatable {
  CountryEntity({
    this.flag,
    this.name,
    this.capital,
  });

  final String flag;
  final String name;
  final String capital;

  @override
  List<Object> get props => [flag, name, capital];

  @override
  bool get stringify => throw UnimplementedError();
}
