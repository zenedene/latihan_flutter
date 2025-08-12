import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/football_controller.dart';
import 'package:latihan1/widget/widget_button.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});
  final FootballController footballController = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Football Players")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tambahkan gambar pemain
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        footballController.players[index].image,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),

                    // Nama pemain
                    Text(
                      footballController.players[index].name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    // Posisi pemain
                    Text(
                      "Position: ${footballController.players[index].position}",
                    ),
                    SizedBox(height: 5),

                    // Tim pemain
                    Text("Team: ${footballController.players[index].team}"),
                    SizedBox(height: 10),

                    // Tombol Edit
                    CustomButton(
                      text: "Edit",
                      textColor: Colors.blueAccent,
                      onPressed: () {
                        Get.toNamed(
                          '/footballEdit',
                          arguments: footballController.players[index],
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
