import 'base.dart';

class SmartTask extends ItemBase {
  String name;
  String describ;
  double time_start;

  SmartTask({
    this.name,
    this.describ,
  }) : super(title: name, subTitle: describ);
}
