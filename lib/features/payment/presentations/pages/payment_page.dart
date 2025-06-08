import 'package:delivery_client/core/theme/colors.dart';
import 'package:delivery_client/features/payment/widgets/card_details.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class PaymentDetailsPage extends StatelessWidget {
  const PaymentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f5ff),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
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
                        Expanded(child: Text('Оплата', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20))),
                        SizedBox(width: 64),
                      ],
                    ),
                    SizedBox(height: 36),
                    Text("Кредитные карты", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                    ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return CardDetails(title: 'Visa ....5674', image: 'assets/icons/visa.svg');
                      },
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.pushNamed('linking_card');
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFebecf5), border: Border.all(color: Colors.white, width: 1)),
                            child: SvgPicture.asset('assets/icons/plus.svg'),
                          ),
                          SizedBox(width: 12),
                          Text("Привязать карту", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    Text("Другие способы оплаты", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                    SizedBox(height: 24),
                    CardDetails(title: 'Наличные', image: 'assets/icons/wallet.svg', isSelected: true),

                    SizedBox(height: 100),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 24),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor, // Цвет фона
                        padding: const EdgeInsets.symmetric(vertical: 15), // Отступы
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(31)),
                      ),
                      child: Text("Готово", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
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
