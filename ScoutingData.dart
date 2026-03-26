
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ScouterApp()));
}

class ScouterApp extends StatefulWidget {
  const ScouterApp({super.key});

  @override
  State<ScouterApp> createState() => _ScouterAppState();
}


class _ScouterAppState extends State<ScouterApp> {
  // 1. Controllers and Variables
  final TextEditingController _teamController = TextEditingController();
  int autoPieces = 0;

  void increment() => setState(() => autoPieces++);
  void decrement() => setState(() { if (autoPieces > 0) autoPieces--; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Team 2080 Scouter"), backgroundColor: Colors.blueGrey),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 2. Team Number Input Field
            TextField(
              controller: _teamController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Team Number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.group),
              ),
            ),
            const SizedBox(height: 30),
            
            // 3. Counter Section
            const Text("Auto Pieces:", style: TextStyle(fontSize: 18)),
            Text("$autoPieces", style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: decrement, icon: const Icon(Icons.remove_circle_outline, size: 40)),
                const SizedBox(width: 40),
                IconButton(onPressed: increment, icon: const Icon(Icons.add_circle_outline, size: 40, color: Colors.green)),
              ],
            ),
            
            const Spacer(),
            
            // 4. Submit Button (Prepares for the QR code later)
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              onPressed: () {
                print("Saving Data for Team: ${_teamController.text}");
              }, 
              child: const Text("SAVE MATCH DATA"),
            ),
          ],
        ),
      ),
    );
  }
}

