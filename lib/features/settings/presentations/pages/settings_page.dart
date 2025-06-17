
import 'package:delivery_client/features/widget/list_action_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf4f5ff),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
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
                    Expanded(child: Text('Настройки', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20))),
                    SizedBox(width: 64),
                  ],
                ),
                SizedBox(height: 36),
                ListActionItem(title: 'Руский', leftImage: 'assets/icons/earth.svg', rightImage: 'assets/icons/left.svg', onTap: () {}, leftImagePadding: 16),
                ListActionItem(title: 'Выйти', leftImage: 'assets/icons/logout.svg', rightImage: 'assets/icons/left.svg', onTap: () {}, leftImagePadding: 16),
                ListActionItem(title: 'Удалить аккаунт', leftImage: 'assets/icons/trash.svg', rightImage: 'assets/icons/close.svg', leftImagePadding: 16, onTap: () {}, color: Color(0xFFFF564A)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
