import 'package:delivery_client/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourierSearchWidget extends StatelessWidget {
  const CourierSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isCanceled = false;
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

            !isCanceled
                ? Row(
                  children: [
                    Text('Поиск курьера...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black)),
                    Spacer(),
                    Text('00:01', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black)),
                  ],
                )
                : Text('Заказ отменен', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black)),

            Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 24), child: Divider(color: Color(0xFFEEEEEE), height: 1)),
            Text("Способ оплаты", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFF4F4F4)),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: SvgPicture.asset('assets/icons/visa.svg', fit: BoxFit.fill),
                  ),
                  SizedBox(width: 12),
                  Text('+7 707 564 7466', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text("Данные получателя", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(vertical: 29, horizontal: 24),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFF4F4F4)),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/phone_call.svg', fit: BoxFit.fill),
                      SizedBox(width: 12),
                      Text('+7 707 564 7466', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black)),
                    ],
                  ),
                  Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 29), child: Divider(color: Color(0xFFCBCBCB), height: 1)),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/points.svg', fit: BoxFit.fill),
                      SizedBox(width: 12),
                      Expanded(child: Text('Shymkent, Shagabutinov 109', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Align(
              child:
                  !isCanceled
                      ? GestureDetector(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF4F4F4)),
                              padding: EdgeInsets.all(26),
                              child: SvgPicture.asset('assets/icons/close.svg', fit: BoxFit.fill, width: 28, height: 28),
                            ),
                            SizedBox(height: 12),
                            Text('Отменить заказ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFFA1A1A1))),
                          ],
                        ),
                      )
                      : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor, // Цвет фона
                            padding: const EdgeInsets.symmetric(vertical: 15), // Отступы
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
                          ),
                          child: Text("Готово", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                      ),
            ),
            SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}
