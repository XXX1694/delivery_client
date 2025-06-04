import 'package:delivery_client/core/theme/colors.dart';
import 'package:delivery_client/features/widget/custom_texfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _fioController = TextEditingController();
  final _iinController = TextEditingController();
  final _cityController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _fioController.dispose();
    _iinController.dispose();
    _cityController.dispose();
    _dobController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              SizedBox(
                height: 64,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Вход',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            color: const Color(0xFF111111).withOpacity(0.02),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/left_arrow.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                'Создать аккаунт',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                hint: 'ФИО',
                iconPath: 'assets/icons/name.svg',
                controller: _fioController,
              ),
              CustomTextField(
                hint: 'ИИН',
                iconPath: 'assets/icons/iin.svg',
                controller: _iinController,
              ),
              CustomTextField(
                hint: 'Город',
                iconPath: 'assets/icons/city.svg',
                controller: _cityController,
              ),
              CustomTextField(
                hint: 'Дата рождения',
                iconPath: 'assets/icons/date.svg',
                controller: _dobController,
                readOnly: true,
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    _dobController.text =
                        '${picked.day.toString().padLeft(2, '0')}.${picked.month.toString().padLeft(2, '0')}.${picked.year}';
                  }
                },
              ),
              const Spacer(),
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                child: Container(
                  height: 64,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
