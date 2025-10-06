import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/contact_controller.dart';
import 'package:latihan1/widget/widget_textField.dart'; // sesuaikan path
import 'package:latihan1/widget/widget_button.dart'; // sesuaikan path

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ContactController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Contact Page'), elevation: 2),
      body: Column(
        children: [
          // Header Section - Input & Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Masukkan nama',
                    controller: controller.nameController,
                    obscureText: false,
                  ),
                ),
                const SizedBox(width: 12),
                CustomButton(
                  text: 'Save',
                  textColor: Colors.black54,
                  onPressed: controller.addName,
                ),
              ],
            ),
          ),

          // ListView Section - Display Data
          Expanded(
            child: Obx(() {
              if (controller.names.isEmpty) {
                return const Center(
                  child: Text(
                    'Belum ada data.\nSilahkan input nama terlebih dahulu.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: controller.names.length,
                itemBuilder: (context, index) {
                  final item = controller.names[index];
                  final id = item['id'] as int;
                  final name = item['name'] as String;

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(name, style: const TextStyle(fontSize: 16)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () =>
                                controller.showEditDialog(context, id, name),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _showDeleteConfirmDialog(
                              context,
                              controller,
                              id,
                              name,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmDialog(
    BuildContext context,
    ContactController controller,
    int id,
    String name,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus "$name"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.deleteName(id);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Hapus', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
