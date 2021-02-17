class MemberBase {
  String title = '';
  String subTitle = '';
  List index = [0, 0, 0, 0];
  var memberURL;

  MemberBase({this.title, this.subTitle=''});
}

class GroupBase {
  String title = '';
  String section = '';
  int iconRef = 0;
  int index = 0;
  var members = <MemberBase>[];

  GroupBase({this.title, this.section, this.index, this.iconRef, this.members});
}
