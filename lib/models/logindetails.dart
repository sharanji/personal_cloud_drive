class Logindetails {
  Logindetails(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.message,
      required this.contactNumber,
      required this.attachmentId,
      this.profileImageBytes =
          'https://media.istockphoto.com/id/1131164548/vector/avatar-5.jpg?s=612x612&w=0&k=20&c=CK49ShLJwDxE4kiroCR42kimTuuhvuo2FH5y_6aSgEo=',
      this.status = ''});

  int userId;
  String firstName;
  String lastName;
  String userName;
  String message;
  String contactNumber;
  String profileImageBytes;
  int attachmentId;
  String status;
  bool currentUser = false;
}
