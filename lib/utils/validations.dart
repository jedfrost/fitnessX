import 'package:fitnessx/utils/contansts.dart';

extension Validation on String {

  bool isValid() => isNotEmpty && Constants.emailRegex.hasMatch(this);
}