import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/di/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> congigureInjection() async {
  getIt.init(environment: Environment.prod);
}
