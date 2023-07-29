import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Shree';
  String email = 'shree@gmail.com';
  String address = 'Cse department 7A1';
  String phone = '1234567890';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imag/dairy_image.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5),
                BlendMode.dstATop,
              ),
              child: Container(color: Colors.white),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDetailCard('Name', name),
                buildDetailCard('Email', email),
                buildDetailCard('Address', address),
                buildDetailCard('Phone', phone),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showEditDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: TextStyle(fontSize: 18),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('Edit'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement logout functionality
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(fontSize: 18),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              label + ':',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController nameController = TextEditingController(text: name);
        TextEditingController emailController = TextEditingController(text: email);
        TextEditingController addressController =
            TextEditingController(text: address);
        TextEditingController phoneController = TextEditingController(text: phone);

        return AlertDialog(
          title: Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  email = emailController.text;
                  address = addressController.text;
                  phone = phoneController.text;
                });
                Navigator.pop(context); // Close the dialog
              },
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog without saving
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}


