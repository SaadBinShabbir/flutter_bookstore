class Address {
  final String id;
  final String title;
  final String fullName;
  final String addressLine1;
  final String? addressLine2;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String phoneNumber;
  final bool isDefault;
  final bool hasPoBox;

  const Address({
    required this.id,
    required this.title,
    required this.fullName,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.phoneNumber,
    this.isDefault = false,
    this.hasPoBox = false,
  });

  // Create a copy with updated fields
  Address copyWith({
    String? id,
    String? title,
    String? fullName,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? phoneNumber,
    bool? isDefault,
    bool? hasPoBox,
  }) {
    return Address(
      id: id ?? this.id,
      title: title ?? this.title,
      fullName: fullName ?? this.fullName,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isDefault: isDefault ?? this.isDefault,
      hasPoBox: hasPoBox ?? this.hasPoBox,
    );
  }

  // Get formatted address
  String get formattedAddress {
    final parts = [
      addressLine1,
      if (addressLine2 != null && addressLine2!.isNotEmpty) addressLine2,
      '$city, $state $zipCode',
      country,
    ];
    return parts.join('\n');
  }

  // Dummy data for testing
  static List<Address> dummyAddresses = [
    const Address(
      id: '1',
      title: 'My home',
      fullName: 'Saad Bin Shabbir',
      addressLine1: '123 Main Street',
      addressLine2: 'Apt 4B',
      city: 'New York',
      state: 'NY',
      zipCode: '10001',
      country: 'United States',
      phoneNumber: '+1 555-123-4567',
      isDefault: true,
    ),
    const Address(
      id: '2',
      title: 'Office',
      fullName: 'Saad Bin Shabbir',
      addressLine1: '456 Business Ave',
      addressLine2: 'Suite 200',
      city: 'New York',
      state: 'NY',
      zipCode: '10002',
      country: 'United States',
      phoneNumber: '+1 555-987-6543',
      isDefault: false,
    ),
  ];
}
