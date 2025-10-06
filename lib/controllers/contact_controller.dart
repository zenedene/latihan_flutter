import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/db_helper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final names = <Map<String, dynamic>>[].obs;
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.value = data;
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

  Future<void> updateName(int id, String newName) async {
    if (newName.trim().isEmpty) return;
    final database = await _dbHelper.db;
    await database.update(
      'contacts',
      {'name': newName},
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchNames();
  }

  Future<void> deleteName(int id) async {
    final database = await _dbHelper.db;
    await database.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchNames();
  }

  void showEditDialog(BuildContext context, int id, String currentName) {
    final editController = TextEditingController(text: currentName);
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Nama'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(
              hintText: 'Masukkan nama baru',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (editController.text.trim().isNotEmpty) {
                  updateName(id, editController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}