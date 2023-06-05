import 'dart:async';
import 'package:domain/modules/home/activity/entity/activity_entity.dart';
import 'package:get/get.dart';

class CacheController extends GetxController {

  ///
  /// TMPS project
  ///
  /// This is an example of Memento pattern
  ///

  ActivityEntity? _previousActivity;

  RxBool hasCached = false.obs;

  set setPreviousActivity(ActivityEntity activityEntity) {
    _previousActivity = activityEntity;
    hasCached.value = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick > 5) {
        timer.cancel();
        _previousActivity = null;
        hasCached.value = false;
      }
    });
  }

  ActivityEntity get getPreviousActivity {
    hasCached.value = false;
    return _previousActivity!;
  }
}
