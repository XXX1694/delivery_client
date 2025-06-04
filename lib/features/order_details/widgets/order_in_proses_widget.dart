import 'package:delivery_client/core/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderInProsesWidget extends StatelessWidget {
  const OrderInProsesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 12, bottom: 24),
                height: 5,
                width: 64,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFEEEEEE)),
              ),
            ),
            Text('Заказ в обработке', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              children: const [
                Text("Код заказа: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xFFA1A1A1))),
                Text("X4R7B9P2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 24), child: Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE))),

            Text(
              "Заказ в процессе обработки. Вы можете отслеживать прогресс маршрута на странице истории заказов.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFA1A1A1)),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // showOrderInProsesBottom();
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor, // Цвет фона
                      padding: const EdgeInsets.symmetric(vertical: 15), // Отступы
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
                    ),
                    child: Text("Новый заказ", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // showOrderInProsesBottom();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF4F4F4), // Цвет фона
                      padding: const EdgeInsets.symmetric(vertical: 15), // Отступы
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
                    ),
                    child: Text("История заказов", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
