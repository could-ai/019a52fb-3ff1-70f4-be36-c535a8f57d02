import 'package:flutter/material.dart';
import 'package:couldai_user_app/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _ownerEmailController = TextEditingController();
  final _ownerPasswordController = TextEditingController();

  // Hardcoded owner credentials as per the request.
  // Note: This is not a secure practice for a real application.
  final String _ownerEmail = 'kolanukirankumar@gmail.com';
  final String _ownerPassword = 'darkmoonshadow';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _ownerEmailController.dispose();
    _ownerPasswordController.dispose();
    super.dispose();
  }

  void _handleOwnerLogin() {
    if (_ownerEmailController.text == _ownerEmail &&
        _ownerPasswordController.text == _ownerPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Sign In'),
            Tab(text: 'Sign Up'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSignInTab(context),
          _buildSignUpTab(context),
        ],
      ),
    );
  }

  Widget _buildSignInTab(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            // Owner Login
            Text('Owner Login', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            TextField(
              controller: _ownerEmailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _ownerPasswordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _handleOwnerLogin,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Sign In as Owner'),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),
            // User Login
            Text('User Login', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.g_mobiledata), // Placeholder for Google Icon
              label: const Text('Sign In with Google'),
              onPressed: () {
                // TODO: Handle Google Sign In
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.phone),
              label: const Text('Sign In with Phone Number'),
              onPressed: () {
                // TODO: Handle Phone Sign In
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Create a User Account', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 24),
           ElevatedButton.icon(
            icon: const Icon(Icons.g_mobiledata), // Placeholder for Google Icon
            label: const Text('Sign Up with Google'),
            onPressed: () {
              // TODO: Handle Google Sign Up
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.phone),
            label: const Text('Sign Up with Phone Number'),
            onPressed: () {
              // TODO: Handle Phone Sign Up
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
