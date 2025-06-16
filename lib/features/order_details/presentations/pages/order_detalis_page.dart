import 'package:delivery_client/core/theme/colors.dart';
import 'package:delivery_client/features/widget/custom_texfield.dart';
import 'package:delivery_client/features/order_details/widgets/order_in_proses_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  final TextEditingController nameController = TextEditingController();

  void showOrderInProsesBottom() {
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: const Color(0xFFfefefe), builder: (_) => OrderInProsesWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f5ff),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            context.pop();
                          },
                          child: Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                            child: Center(child: SvgPicture.asset('assets/icons/left_arrow.svg')),
                          ),
                        ),
                        // Просто текст, без Expanded и SizedBox
                        Expanded(child: Text('Детали заказа', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20))),
                        SizedBox(width: 64),
                      ],
                    ),
                    SizedBox(height: 36),
                    Text("Данные получателя", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                    SizedBox(height: 12),
                    CustomTextField(hint: "Имя получателя"),
                    CustomTextField(hint: "Номер получателя"),
                    SizedBox(height: 8),
                    Text("Комментарий к заказу", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                    SizedBox(height: 12),
                    CustomTextField(hint: "Комментарий"),
                    SizedBox(height: 8),

                    Text("Время забора заказа", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hint: 'Дата',
                            iconPath: 'assets/icons/date.svg',
                            controller: _dobController,
                            readOnly: true,
                            onTap: () async {
                              final picked = await showDatePicker(context: context, initialDate: DateTime(2000, 1, 1), firstDate: DateTime(1900), lastDate: DateTime.now());
                              if (picked != null) {
                                _dobController.text = '${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}';
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(child: CustomTextField(hint: 'Время', iconPath: 'assets/icons/clock.svg')),
                      ],
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showOrderInProsesBottom();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor, // Цвет фона
                        padding: const EdgeInsets.symmetric(vertical: 15), // Отступы
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
                      ),
                      child: Text(nameController.text.trim().isEmpty ? "Готово" : 'Заказать за 8940 тг', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
