import 'package:flutter/material.dart';

//https://github.com/AdilEnaanai/fluttersuptech
void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TP1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/maroc.jpg'),
              ),
              SizedBox(width: 10),
              Text(
                'TP1',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  print('Button Pressed');
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 172, 63, 9),
                    child: Text('A', style: TextStyle(color: Colors.white)),
                  ),
                  title: Text('Item ${index + 1}'),
                  subtitle: Text('Subtitle for item ${index + 1}'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
