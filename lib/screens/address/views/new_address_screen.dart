import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/address_model.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({super.key});

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _phoneController = TextEditingController(text: '+1 ');

  String _selectedCountry = 'United States';
  bool _isDefault = false;
  bool _hasPoBox = false;

  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'Netherlands',
    'Switzerland',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _fullNameController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      // Create new address
      final newAddress = Address(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        fullName: _fullNameController.text,
        addressLine1: _addressLine1Controller.text,
        addressLine2: _addressLine2Controller.text.isEmpty ? null : _addressLine2Controller.text,
        city: _cityController.text,
        state: _stateController.text,
        zipCode: _zipCodeController.text,
        country: _selectedCountry,
        phoneNumber: _phoneController.text,
        isDefault: _isDefault,
        hasPoBox: _hasPoBox,
      );

      // TODO: Save address to backend/database
      // For now, just show success message and go back
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address saved successfully')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            "assets/icons/Arrow - Left.svg",
            height: 24,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: const Text(
          "New address",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Address Title
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Address title",
                    hintText: "Type address title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an address title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),

                // Use Current Location Card
                Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(defaultBorderRadious),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Location.svg",
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: defaultPadding),
                      const Expanded(
                        child: Text(
                          "Use my current location",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/miniRight.svg",
                        height: 16,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.shade400,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: defaultPadding),

                // Country/Region Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedCountry,
                  decoration: InputDecoration(
                    labelText: "Country / Region",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                  items: _countries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCountry = value!;
                    });
                  },
                ),
                const SizedBox(height: defaultPadding),

                // Full Name
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: "Full name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),

                // Address Line 1
                TextFormField(
                  controller: _addressLine1Controller,
                  decoration: InputDecoration(
                    labelText: "Address line 1",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter address line 1';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),

                // Address Line 2
                TextFormField(
                  controller: _addressLine2Controller,
                  decoration: InputDecoration(
                    labelText: "Address line 2",
                    hintText: "Optional",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),

                // P.O. Box Toggle
                Row(
                  children: [
                    const Text(
                      "P.O. Box",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: _hasPoBox,
                      onChanged: (value) {
                        setState(() {
                          _hasPoBox = value;
                        });
                      },
                      activeColor: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding),

                // City
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),

                // State
                TextFormField(
                  controller: _stateController,
                  decoration: InputDecoration(
                    labelText: "State",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),

                // Zip Code
                TextFormField(
                  controller: _zipCodeController,
                  decoration: InputDecoration(
                    labelText: "Zip code",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your zip code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),

                // Phone Number
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(defaultBorderRadious),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: defaultPadding),

                // Set Default Address Toggle
                Row(
                  children: [
                    const Text(
                      "Set default address",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      value: _isDefault,
                      onChanged: (value) {
                        setState(() {
                          _isDefault = value;
                        });
                      },
                      activeColor: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding * 2),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveAddress,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultBorderRadious),
                      ),
                    ),
                    child: const Text(
                      "Save address",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
