class MemberBase {
  String title = '';
  String subTitle = '';
  List index = [0, 0, 0, 0];

  MemberBase({this.title, this.subTitle});
}

class GroupBase {
  String title = '';
  String section = '';
  int index = 0;

  GroupBase({this.title, this.section, this.index});
}

class TrackBase {}

class QueryBase {}

class JudgeBase {}
