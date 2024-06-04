import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormScreen extends StatefulWidget {
  static String routeName = "/form";

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _bloodGrpController = TextEditingController();
  final _doctorController = TextEditingController();
  final _consentController = TextEditingController();
  final _date_of_visitController = TextEditingController();
  final _ageController = TextEditingController();
  final _sexController = TextEditingController();
  final _addressController = TextEditingController();

  // Add controllers for other fields as needed

  String? _name;
  String? _email;
  String? _phone;
  String? _dob;
  String? _city;
  String? _state;
  String? _blood_Grp;
  String? _doctor;
  String? _consent;
  String? _date_of_visit;
  String? _age;
  String? _sex;
  String? _address;
  // Add variables for other fields

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _bloodGrpController.dispose();
    _doctorController.dispose();
    _consentController.dispose();
    _date_of_visitController.dispose();
    _ageController.dispose();
    _sexController.dispose();
    _addressController.dispose();
    // Dispose of other controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Form'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextFormField(
                  'Name',
                  _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                _buildTextFormField(
                  'Age',
                  _ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Age.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                _buildTextFormField(
                  'Sex',
                  _sexController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Sex';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                _buildTextFormField(
                  'Date of Birth',
                  _dobController,
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                _buildTextFormField(
                  'BloodGroup',
                  _bloodGrpController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your BloodGrp';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                _buildTextFormField(
                  'Consent',
                  _consentController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Sex';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),

                _buildTextFormField(
                  'Name of the Doctor',
                  _doctorController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please name of your treating doctor';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                _buildTextFormField(
                  'City',
                  _cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your City';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                _buildTextFormField(
                  'State',
                  _stateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Age.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                _buildTextFormField(
                  'Email',
                  _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                _buildTextFormField(
                  'Phone Number',
                  _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0,),
                _buildTextFormField(
                  'Address',
                  _phoneController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),

                // Add more form fields here using _buildTextFormField
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Handle form submission (e.g., process data, navigate)
                      print('Name: $_name');
                      print('Email: $_email');
                      print('Phone: $_phone');
                      // Add logic to process other field values
                    }
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent,
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text,
        List<TextInputFormatter>? inputFormatters,
        String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
      validator: validator,
      onSaved: (value) => setState(() => _name = value),
      // Update onSaved callback for other fields as needed
    );
  }
}