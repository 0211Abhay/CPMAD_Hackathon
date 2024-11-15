// form_screen.dart
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final List<Map<String, dynamic>> _recipients = [
    {'initials': 'DA', 'name': 'Dhaval Anadkat'},
    {'initials': 'AB', 'name': 'Arjav Bhavrava'},
    {'initials': 'CP', 'name': 'Chandrasinh Parmar'},
    {'initials': 'MS', 'name': 'Mitesh Solanki'},
  ];

  final Map<String, bool> _skills = {
    'HTML': false,
    'CSS': false,
    'Flutter': true,
    'Blockchain': true,
    'ML': false,
    'Android': true,
    'Java': true,
  };

  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    '9:41',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.signal_cellular_alt),
                  SizedBox(width: 8),
                  Icon(Icons.wifi),
                  SizedBox(width: 8),
                  Icon(Icons.battery_full),
                ],
              ),
              const SizedBox(height: 20),
              // Send to section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Send to',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_up),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Recipients list
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: _recipients.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Text(
                          _recipients[index]['initials'],
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                      title: Text(_recipients[index]['name']),
                    );
                  },
                ),
              ),
              // Skills section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Skills',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_up),
                ],
              ),
              const SizedBox(height: 16),
              // Skills checkboxes
              Expanded(
                child: ListView(
                  children: _skills.entries.map((entry) {
                    return CheckboxListTile(
                      title: Text(entry.key),
                      value: entry.value,
                      onChanged: (bool? value) {
                        setState(() {
                          _skills[entry.key] = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }).toList(),
                ),
              ),
              // Description section
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Write your description here',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Send button
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    // Add your send logic here
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}