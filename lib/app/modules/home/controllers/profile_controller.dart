import 'package:crud_auth/app/core/services/jwt_service.dart';
import 'package:mobx/mobx.dart';
part 'profile_controller.g.dart';

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  final JwtService _jwtService;
  ProfileControllerBase(this._jwtService);

  logout() async {
    await _jwtService.logout();
  }
}
