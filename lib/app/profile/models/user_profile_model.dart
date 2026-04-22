class UserProfile {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String photo;

  UserProfile({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.photo,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    final customerData = json['customer_data'] ?? {};
    
    return UserProfile(
      firstName: data['first_name'] ?? '',
      lastName: data['last_name'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      photo: customerData['photo'] ?? '',
    );
  }

  String get fullName => "$firstName $lastName";
}
