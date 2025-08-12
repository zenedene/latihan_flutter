import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/football_controller.dart';
import 'package:latihan1/widget/widget_button.dart';

class FootballEditPage extends StatefulWidget {
  const FootballEditPage({super.key});

  @override
  State<FootballEditPage> createState() => _FootballEditPageState();
}

class _FootballEditPageState extends State<FootballEditPage> {
  final FootballController footballController = Get.find();

  // Controllers for TextFields
  late TextEditingController nameController;
  late TextEditingController positionController;
  late TextEditingController teamController;

  // Index pemain yang sedang diedit
  late int playerIndex;

  @override
  void initState() {
    super.initState();

    // Ambil data pemain dari argument
    final player = Get.arguments;

    // Cari index dari pemain ini di list
    playerIndex = footballController.players.indexWhere(
      (p) => p.name == player.name && p.team == player.team,
    );

    // Inisialisasi text controllers dengan data awal
    nameController = TextEditingController(text: player.name);
    positionController = TextEditingController(text: player.position);
    teamController = TextEditingController(text: player.team);
  }

  @override
  void dispose() {
    // Bersihkan controller
    nameController.dispose();
    positionController.dispose();
    teamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Player")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: positionController,
              decoration: const InputDecoration(labelText: "Position"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: teamController,
              decoration: const InputDecoration(labelText: "Team"),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Save",
              textColor: Colors.white,
              onPressed: () {
                // Update data pemain
                final updatedPlayer = footballController.players[playerIndex]
                    .copyWith(
                      name: nameController.text,
                      position: positionController.text,
                      team: teamController.text,
                    );

                footballController.players[playerIndex] = updatedPlayer;

                Get.back(); // Kembali ke halaman list
              },
            ),
          ],
        ),
      ),
    );
  }
}
