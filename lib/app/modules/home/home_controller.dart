import 'package:country_quiz/app/domain/repositories/country_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

@Injectable()
class HomeController {
  final ICountryRepository countryRepository;

  HomeController(this.countryRepository);
}
