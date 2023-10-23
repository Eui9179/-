/// todo freezed
class PhoneNumberRequest {
  final String phoneNumber;

  PhoneNumberRequest({
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'phoneNumber': phoneNumber,
    };
  }
}
