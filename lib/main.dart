import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PageController pageController = PageController(initialPage: 0);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void previousPage() {
    pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;

    // Add logic to handle the login action here.
    // For simplicity, we'll navigate to a new page with a "Hi" message and the email address.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HiMessagePage(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Login Page"),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(), // Disable swiping between pages
        children: [
          // First Page (Email)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email Address",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: nextPage,
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
          // Second Page (Password)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: login,
                  child: const Text("Login"),
                ),
                TextButton(
                  onPressed: previousPage, // Navigate back to the email page
                  child: const Text("Back"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HiMessagePage extends StatelessWidget {
  final String email;

  const HiMessagePage({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Hi!"),
            Text("Email: $email"),
          ],
        ),
      ),
    );
  }
}

