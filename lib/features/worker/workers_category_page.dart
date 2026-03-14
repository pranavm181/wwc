import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:work_wave_connect/core/app_theme.dart';
import 'package:work_wave_connect/data/repositories/data_repository.dart';
import 'package:work_wave_connect/features/worker/person_details.dart';

class WorkersCategoryPage extends StatefulWidget {
  final Map<String, dynamic> worker;

  const WorkersCategoryPage({super.key, required this.worker});

  @override
  State<WorkersCategoryPage> createState() => _WorkersCategoryPageState();
}

class _WorkersCategoryPageState extends State<WorkersCategoryPage> {
  Stream<QuerySnapshot>? jobDetails;

  @override
  void initState() {
    super.initState();
    _loadJobDetails();
  }

  Future<void> _loadJobDetails() async {
    final stream = await DataRepository().getJobDetails();
    setState(() {
      jobDetails = stream;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryTitle = widget.worker['title'] as String;
    
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppTheme.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: jobDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: AppTheme.primaryColor));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildEmptyState();
          }

          // Filter documents for current category
          final categoryDocs = snapshot.data!.docs.where((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final workerType = data['work']?.toString().toLowerCase() ?? "";
            final selectedType = categoryTitle.toLowerCase().replaceAll("'s", "").trim();
            return workerType.contains(selectedType);
          }).toList();

          if (categoryDocs.isEmpty) {
            return _buildEmptyState();
          }

          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: categoryDocs.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final workData = categoryDocs[index].data() as Map<String, dynamic>;
              return _buildProfessionalCard(context, workData, categoryDocs[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildProfessionalCard(BuildContext context, Map<String, dynamic> work, DocumentSnapshot doc) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonDetails(profileDetails: doc),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor.withAlpha(20),
                    borderRadius: BorderRadius.circular(16),
                    image: (work['workerImage'] as String?)?.isNotEmpty == true
                        ? DecorationImage(image: AssetImage(work['workerImage']), fit: BoxFit.cover)
                        : null,
                  ),
                  child: (work['workerImage'] as String?)?.isEmpty ?? true
                      ? Icon(Icons.person, color: AppTheme.accentColor, size: 30)
                      : null,
                ),
                const SizedBox(width: 16),
                
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            work['work'] ?? 'General Service',
                            style: const TextStyle(
                              color: AppTheme.accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.green.shade100),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star, size: 12, color: Colors.green.shade600),
                                const SizedBox(width: 4),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        work['name'] ?? 'Professional',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade400),
                          const SizedBox(width: 4),
                          Text(
                            work['place'] ?? 'Local',
                            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                          ),
                          const SizedBox(width: 12),
                          Icon(Icons.work_history_outlined, size: 14, color: Colors.grey.shade400),
                          const SizedBox(width: 4),
                          Text(
                            "${work['yearofexp'] ?? 0} Yrs",
                            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
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
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.search_off_rounded, size: 64, color: Colors.grey.shade400),
          ),
          const SizedBox(height: 16),
          Text(
            'No professionals found', 
            style: TextStyle(
              color: Colors.grey.shade600, 
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try exploring other categories', 
            style: TextStyle(color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}
