import 'package:delivery_client/core/theme/colors.dart';
import 'package:delivery_client/features/widget/custom_texfield.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LinkingCardPage extends StatelessWidget {
  const LinkingCardPage({super.key});

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
                        Expanded(child: Text('Привязка карты', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20))),
                        SizedBox(width: 64),
                      ],
                    ),
                    SizedBox(height: 36),

                    CustomTextField(hint: 'Номер карты'),

                    Row(children: [Expanded(child: CustomTextField(hint: 'Cрок годности')), SizedBox(width: 12), Expanded(child: CustomTextField(hint: 'CVV', keyBoardType: TextInputType.number))]),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
