//its lowkey been a while but I promise I was making code for this project here and there, just forgot to update it on my github acc, I fixed the import for the qr code error and made it automatically generate the qr code, now I am working on to add more questions in 
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

// The digital filing cabinet
Map<String, dynamic> scoutingData = {
  "teamNumber": "",
  "autoPieces": 0,
  "teleopPieces": 0,
  "hasLimelight": false,
  "programmingLanguage": "Java",
  "climbLevel": "None",
  "reliability": 5.0,
  "funQuestion": "",
};




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
 //inal TextEditingController _teamController = TextEditingController();
  int autoPieces = 0;

  void increment() => setState(() => autoPieces++);
  void decrement() => setState(() { if (autoPieces > 0) autoPieces--; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Team 2080 Scouter"), backgroundColor: const Color.fromARGB(255, 105, 63, 202)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
            children: [
              ListTile(
              
  title: const Text("Alliance Partner Vibe Check"),
  trailing: DropdownButton<String>(
    value: scoutingData["vibeCheck"],
    items: ["Chill", "Stressed", "Locked In", "Chaos"].map((s) => 
      DropdownMenuItem(value: s, child: Text(s))).toList(),
    onChanged: (val) => setState(() => scoutingData["vibeCheck"] = val!),
  ),
),


    // --- SECTION 1: BASIC INFO ---
    TextField(
      onChanged: (val) => scoutingData["teamNumber"] = val,
      decoration: const InputDecoration(labelText: "Team Number", border: OutlineInputBorder()),
      keyboardType: TextInputType.number,
    ),

    // --- SECTION 2: HARDWARE (The "Technical" stuff) ---
    ExpansionTile(
      title: const Text("Robot Hardware & Software"),
      children: [
        SwitchListTile(
          title: const Text("Has Limelight?"),
          value: scoutingData["hasLimelight"],
          onChanged: (val) => setState(() => scoutingData["hasLimelight"] = val),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (val) => scoutingData["programmingLanguage"] = val,
            decoration: const InputDecoration(labelText: "Programming Language"),
          ),
        ),
      ],
    ),

    // --- SECTION 3: PERFORMANCE ---
    ExpansionTile(
      title: const Text("Match Performance"),
      children: [
        const Text("Intake Reliability (1-10)"),
        Slider(
          value: scoutingData["reliability"],
          min: 1, max: 10, divisions: 9,
          onChanged: (val) => setState(() => scoutingData["reliability"] = val),
        ),
        DropdownButton<String>(
          value: scoutingData["climbLevel"],
          items: ["None", "Low", "Mid", "High"].map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (val) => setState(() => scoutingData["climbLevel"] = val!),
        ),
      ],
    ),

    // --- SECTION 4: GOOFY QUESTIONS ---
    ExpansionTile(
      title: const Text("The Fun Stuff"),
      children: [
        TextField(
          onChanged: (val) => scoutingData["funQuestion"] = val,
          decoration: const InputDecoration(labelText: "If this bot was a snack/animal, what would it be?"),
        ),
      ],
    ),
    QrImageView(
            data: scoutingData.toString(),
            version: QrVersions.auto,
            size: 200.0,
            backgroundColor: Colors.white,
          ),
          
    const SizedBox(height: 20),
    ElevatedButton(
      onPressed: () {
        QrImageView(
        data: 'Team 2080 Rocks!',
        version: QrVersions.auto,
        size: 200.0,
    );},
      child: const Text("Generate QR Code"),
      
    ),
  ],
)

      ),
    );
  }
}
