//part-2

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

// 1. Define the GoRouter configuration with Parameters
final GoRouter _router = GoRouter(
  routes: [
    // Home Route
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    // Product Detail Route with Path Parameter (:id)
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        // Extract the ID from the path (e.g., '42')
        final id = state.pathParameters['id']!;
        // Extract the Query Parameter (e.g., 'popular') or use 'all' as default
        final filter = state.uri.queryParameters['filter'] ?? 'all';

        return ProductDetailScreen(id: id, filter: filter);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router Parameters Lesson',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

// 2. Home Screen with navigation including query params
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          // Navigating to path '/product/42' with query '?filter=popular'
          onPressed: () => context.go('/product/42?filter=popular'),
          child: const Text('View Product 42 (Popular)'),
        ),
      ),
    );
  }
}

// 3. Product Detail Screen receiving the data
class ProductDetailScreen extends StatelessWidget {
  final String id;
  final String filter;

  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(
        child: Text(
          'Showing product $id\nFilter: $filter',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
