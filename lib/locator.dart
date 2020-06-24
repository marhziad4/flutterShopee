import 'package:flutterproject/ViewModels/CRUDModel.dart';
import 'package:flutterproject/services/Api.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
setUpLocator(){
  getIt.registerLazySingleton(() => Api('products'));
  getIt.registerLazySingleton(() => CRUDModel());
}