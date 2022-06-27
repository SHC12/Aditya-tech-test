import 'package:get/get.dart';

import '../../../../presentation/movie/controllers/movie.controller.dart';

class MovieControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(
      () => MovieController(),
    );
  }
}
