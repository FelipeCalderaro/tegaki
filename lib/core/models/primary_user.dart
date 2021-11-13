import 'package:anilist_app/core/models/user_configs_model.dart';
import 'package:anilist_app/core/models/user_info_model.dart';

class PrimaryUser {
  UserConfigs configs;
  UserInfo info;

  PrimaryUser({
    required this.configs,
    required this.info,
  });
}
