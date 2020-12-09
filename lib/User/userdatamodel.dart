class UserData {
  final String uid;
  final String displayName;
  final String number;
  final int avatar;

  const UserData({
    this.uid,
    this.displayName,
    this.number,
    this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      uid: json['UID'].toString(),
      displayName: json['DisplayName'].toString(),
      number: json['number'].toString(),
      avatar: json['Avatar'] as int,
    );
  }
}
