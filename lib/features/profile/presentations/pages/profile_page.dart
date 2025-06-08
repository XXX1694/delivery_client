import 'package:delivery_client/features/widget/list_action_item.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  // Просто текст, без Expanded и SizedBox
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ахмет Сыздыков', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                      Text('История заказов', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                    ],
                  ),
                  Spacer(),
                  CupertinoButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      context.pushNamed('settings');
                    },
                    child: Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(color: Color(0xFFeff0fa), border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                      child: Center(child: SvgPicture.asset('assets/icons/settings.svg')),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              buildInfoItem('ИИН', "020304440506"),
              buildInfoItem('Город', "Алматы"),
              buildInfoItem('Дата рождения', "04.02.2002"),
              ListActionItem(title: 'Visa ....5674', leftImage: 'assets/icons/dialog.svg', leftImagePadding: 16, rightImage: 'assets/icons/close.svg', onTap: () {}),
              SizedBox(height: 12),
              Row(children: [Icon(size: 22, Icons.add, color: Colors.black), SizedBox(width: 4), Text("Добавить карту", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))]),
              SizedBox(height: 24),
              ListActionItem(title: 'Visa ....5674', leftImage: 'assets/icons/visa.svg', rightImage: 'assets/icons/left.svg', onTap: () {}),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoItem(String title, String value) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Color(0xFFA1A1A1), fontWeight: FontWeight.w500, fontSize: 16)),
          Text(value, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20)),
        ],
      ),
    );
  }
}
