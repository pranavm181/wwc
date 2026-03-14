import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_wave_connect/core/app_theme.dart';
import 'package:work_wave_connect/data/models/booking_model.dart';
import 'package:work_wave_connect/features/worker/my_worker.dart';
import 'package:work_wave_connect/features/worker/paying_button.dart';
import 'package:work_wave_connect/features/auth/signup_controller.dart';
import 'package:work_wave_connect/features/auth/auth_service.dart';
import 'package:work_wave_connect/features/worker/my_worker1.dart';

class PersonDetails extends StatefulWidget {
  final DocumentSnapshot profileDetails;

  const PersonDetails({
    super.key,
    required this.profileDetails,
  });

  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = widget.profileDetails.data() as Map<String, dynamic>;
    
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 400,
            backgroundColor: AppTheme.backgroundColor,
            surfaceTintColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  onPressed: () => Navigator.pop(context),
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  (data['workerImage'] as String?)?.isNotEmpty == true
                      ? Image.asset(data['workerImage'], fit: BoxFit.cover)
                      : Container(color: Colors.blueGrey.shade100, child: const Icon(Icons.person, size: 80, color: Colors.white)),
                  
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppTheme.backgroundColor.withAlpha(255),
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                  
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            data['work'] ?? 'General Service',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data['name'] ?? 'Professional',
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              '4.8 (120 reviews)', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(Icons.location_on, color: Colors.grey.shade400, size: 18),
                            const SizedBox(width: 4),
                            Text(
                              data['place'] ?? 'Local', 
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => launchUrl(Uri.parse('tel:+91${data['phno']}')),
                          icon: const Icon(Icons.call),
                          label: const Text('Call Now'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {}, // Chat functionality to be implemented
                          icon: const Icon(Icons.chat_bubble_outline),
                          label: const Text('Message'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // About Section
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    data['discription'] ?? 'Experienced professional dedicated to providing high-quality services. Committed to customer satisfaction and reliable work.',
                    style: TextStyle(
                      color: Colors.blueGrey.shade600,
                      height: 1.6,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Details Grid
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(5),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildDetailRow(Icons.work_outline, 'Experience', '${data['yearofexp']} Years'),
                        const Divider(height: 24),
                        _buildDetailRow(Icons.calendar_today_outlined, 'Age', '${data['age']} Years'),
                        const Divider(height: 24),
                        _buildDetailRow(Icons.person_outline, 'Gender', data['Gender'] ?? 'Not specified'),
                        const Divider(height: 24),
                        _buildDetailRow(Icons.phone_android_outlined, 'Contact', data['phno'] ?? 'N/A'),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Book Now Button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => _showBookingSheet(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        shadowColor: AppTheme.accentColor.withAlpha(80),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'BOOK APPOINTMENT',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.accentColor.withAlpha(20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: AppTheme.accentColor),
        ),
        const SizedBox(width: 16),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
      ],
    );
  }

  void _showBookingSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Select Date & Time',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Date Picker Card
                  GestureDetector(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppTheme.primaryColor,
                                onPrimary: Colors.white,
                                onSurface: AppTheme.primaryColor,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        setSheetState(() => selectedDate = picked);
                        setState(() => selectedDate = picked);
                      }
                    },
                    child: _buildBookingOption(
                      icon: Icons.calendar_today,
                      label: 'Date',
                      value: "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Time Picker Card
                  GestureDetector(
                    onTap: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppTheme.primaryColor,
                                onPrimary: Colors.white,
                                onSurface: AppTheme.primaryColor,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        setSheetState(() => selectedTime = picked);
                        setState(() => selectedTime = picked);
                      }
                    },
                    child: _buildBookingOption(
                      icon: Icons.access_time,
                      label: 'Time',
                      value: selectedTime.format(context),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        final user = context.read<FirebaseAuthMethods>().user;
                        final workerData = widget.profileDetails.data() as Map<String, dynamic>;
                        
                        final booking = BookingModel(
                          workerId: widget.profileDetails.id, 
                          userId: user.uid,
                          workerName: workerData['name'] ?? 'Unknown',
                          workerService: workerData['work'] ?? 'Service',
                          userEmail: user.email ?? 'No Email',
                          time: selectedTime.format(context),
                          date: "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                        );
                        context.read<SignUpController>().addBooking(booking);
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WorkerBooking1())); // Navigate to My Bookings
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text('CONFIRM BOOKING', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }
        );
      },
    );
  }

  Widget _buildBookingOption({required IconData icon, required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryColor),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
