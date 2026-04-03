import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

// 1. Define the GoRouter configuration using 'name' properties
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home', // The nickname for this route
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details', // The nickname for this route
      builder: (context, state) => const DetailsScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Named Routes Lesson',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

// 2. Home Screen using goNamed
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          // Instead of path '/details', we use the name 'details'
          onPressed: () => context.goNamed('details'),
          child: const Text('Go to Details'),
        ),
      ),
    );
  }
}

// 3. Simple Details Screen
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(
        child: Text('You navigated here using a Named Route!'),
      ),
    );
  }
}
