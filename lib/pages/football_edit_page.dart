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
  late TextEditingController nameController;
  late TextEditingController positionController;
  late TextEditingController teamController;
  late int playerIndex;

  @override
  void initState() {
    super.initState();
    final player = Get.arguments;
    playerIndex = footballController.players.indexWhere(
      (p) => p.name == player.name && p.team == player.team,
    );
    nameController = TextEditingController(text: player.name);
    positionController = TextEditingController(text: player.position);
    teamController = TextEditingController(text: player.team);
  }

  @override
  void dispose() {
    nameController.dispose();
    positionController.dispose();
    teamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Edit Player",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF1A202C),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Color(0xFF4A5568)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Player Information",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField(nameController, "Name"),
              const SizedBox(height: 16),
              _buildTextField(positionController, "Position"),
              const SizedBox(height: 16),
              _buildTextField(teamController, "Team"),
              const SizedBox(height: 32),
              Center(
                child: SizedBox(
                  height: 48,
                  child: CustomButton(
                    text: "Save Changes",
                    textColor: Colors.white,
                    onPressed: () {
                      final updatedPlayer = footballController
                          .players[playerIndex]
                          .copyWith(
                            name: nameController.text,
                            position: positionController.text,
                            team: teamController.text,
                          );
                      footballController.players[playerIndex] = updatedPlayer;
                      Get.back();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color(0xFF718096),
          fontWeight: FontWeight.w500,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF4299E1), width: 1.5),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF2D3748),
      ),
    );
  }
}
