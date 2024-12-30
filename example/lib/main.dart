import 'package:flutter/material.dart';
import 'package:custom_field_package/custom_field_package.dart'; // Replace with your actual package import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom TextField Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom TextField Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter your email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
              prefixIcon: Icons.email,
              maxLength: 30,
            ),
            SizedBox(height: 20),
            CustomTextField(
              labelText: 'Password',
              controller: _passwordController,
              obscureText: true,
              suffixIcon: Icons.visibility,
              onSuffixIconPressed: () {
                // Toggle visibility of password
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
