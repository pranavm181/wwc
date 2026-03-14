import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:work_wave_connect/core/app_theme.dart';
import 'package:work_wave_connect/data/models/worker_model.dart';
import 'package:work_wave_connect/features/auth/signup_controller.dart';
import 'package:work_wave_connect/features/worker/work_add_page.dart';
import 'package:work_wave_connect/features/auth/auth_service.dart';

class WorkerSignup extends StatefulWidget { 
  const WorkerSignup({super.key});

  @override
  State<WorkerSignup> createState() => _WorkerSignupState(); 
}

class _WorkerSignupState extends State<WorkerSignup> { 
  final nameController = TextEditingController(); 
  final ageController = TextEditingController(); 
  final placeController = TextEditingController(); 
  final discriptionController = TextEditingController(); 
  final yearofexpController = TextEditingController(); 
  
  // Dropdown values
  String? valueChoose; 
  String? genderChoose;
  
  File? _image; 
  final picker = ImagePicker(); 

  Future getImage() async { 
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); 

    setState(() { 
      if (pickedFile != null) { 
        _image = File(pickedFile.path); 
      } 
    }); 
  }

  void addWorker() {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
      return;
    }
    
    final user = context.read<FirebaseAuthMethods>().user;
    
    final worker = WorkerModel(
      name: nameController.text,
      age: ageController.text,
      place: placeController.text,
      phone: "9876543210", // Should be dynamic
      email: user.email ?? "", 
      work: valueChoose ?? 'Other',
      img: _image!.path,
      yearOfExp: yearofexpController.text,
      gender: genderChoose, 
      discription: discriptionController.text,
      context: context, 
    );
    
    context.read<SignUpController>().addWork(worker);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkAdd()));
  }

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar( 
        title: const Text('Worker Registration'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppTheme.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ), 
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(24.0), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [ 
            // Image Upload
            Center(
              child: GestureDetector(
                onTap: getImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.accentColor.withAlpha(50), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.accentColor.withAlpha(30),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                    image: _image != null 
                        ? DecorationImage(image: FileImage(_image!), fit: BoxFit.cover)
                        : null,
                  ),
                  child: _image == null 
                      ? Icon(Icons.add_a_photo_outlined, size: 40, color: AppTheme.accentColor)
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Upload Profile Photo',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 30),

            // Form Fields
            _buildTextField(
              controller: nameController,
              label: 'Full Name',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: ageController,
                    label: 'Age',
                    icon: Icons.calendar_today_outlined,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: const Text('Gender'),
                        value: genderChoose,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                        onChanged: (newValue) => setState(() => genderChoose = newValue),
                        items: ['Male', 'Female', 'Other'].map((value) {
                          return DropdownMenuItem(value: value, child: Text(value));
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text('Select Profession'),
                  value: valueChoose,
                  isExpanded: true,
                  icon: const Icon(Icons.work_outline, color: Colors.grey),
                  onChanged: (newValue) => setState(() => valueChoose = newValue),
                  items: ["Electrician's", "Plumber's", "Carpenter's", "Cleaner's", "Mechanic's", "Home Painter's"].map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            _buildTextField(
              controller: placeController,
              label: 'City / Location',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 16),
            
            _buildTextField(
              controller: yearofexpController,
              label: 'Years of Experience',
              icon: Icons.history_edu_outlined,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            
            _buildTextField(
              controller: discriptionController,
              label: 'Description / Bio',
              icon: Icons.description_outlined,
              maxLines: 3,
            ),
            
            const SizedBox(height: 40),
            
            ElevatedButton(
              onPressed: addWorker,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shadowColor: AppTheme.accentColor.withAlpha(80),
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('REGISTER AS WORKER'),
            ),
          ], 
        ), 
      ), 
    ); 
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: const TextStyle(fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: false,
          prefixIcon: Icon(icon, color: Colors.grey.shade400),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade400),
          contentPadding: maxLines > 1 ? const EdgeInsets.symmetric(vertical: 16) : null,
        ),
      ),
    );
  }
}
