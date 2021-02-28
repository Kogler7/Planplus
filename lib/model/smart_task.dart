import 'base.dart';

class SmartTask extends MemberBase {
  String name;
  String describ;
  double timeStart;

  SmartTask({
    this.name,
    this.describ,
  }) : super(title: name, subTitle: describ);
}
