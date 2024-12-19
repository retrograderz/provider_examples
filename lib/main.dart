import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(), // Tạo và cung cấp instance của CounterProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider Example")),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, counterProvider, child) => Text(
            'Count: ${counterProvider.count}', // Hiển thị giá trị đếm
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increment(); // Tăng giá trị đếm
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
