import 'package:delivery_client/features/create_order/presentaion/widgets/select_box_size_widget.dart';
import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../widgets/address_field.dart';

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final TextEditingController _fromAddressController = TextEditingController();
  final TextEditingController _toAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _fromAddressController.dispose();
    _toAddressController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget _buildButton({required String iconPath, required VoidCallback onTap, required bool isActive, required bool needSvg, String? text, required double width}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: width,
      height: 64,
      decoration: BoxDecoration(color: isActive ? mainColor : Colors.transparent, borderRadius: BorderRadius.circular(100)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (needSvg)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 150),
                    opacity: 1.0,
                    child: SvgPicture.asset(iconPath, width: 24, height: 24, colorFilter: ColorFilter.mode(isActive ? Colors.white : Colors.black, BlendMode.srcIn)),
                  ),
                if (text != null && isActive) ...[
                  const SizedBox(width: 8),
                  Flexible(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 150),
                      opacity: 1.0,
                      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: DGisMap(token: 'c1f433fd-d3a6-42f5-a27a-b53169c09a25', initialCameraPosition: CameraPosition(position: Position(lat: 43.2380, long: 76.8829), zoom: 17.0), theme: MapTheme.LIGHT),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 64,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () => _controller.reverse(),
                          child: Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                            child: Center(child: SvgPicture.asset('assets/icons/left_arrow.svg')),
                          ),
                        ),
                        CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () => _controller.reverse(),
                          child: Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                            child: Center(child: SvgPicture.asset('assets/icons/navigation.svg')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      final isFirstActive = _controller.value < 0.5;

                      final screenWidth = MediaQuery.of(context).size.width - 21;
                      final containerWidth = isFirstActive ? 326.0 : screenWidth;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(isFirstActive ? 8 : 12),
                        constraints: BoxConstraints(maxWidth: containerWidth, minWidth: containerWidth),
                        width: containerWidth,
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFEEEEEE), width: 1), borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      height: isFirstActive ? 0 : 280,
                                      child: SingleChildScrollView(
                                        physics: const NeverScrollableScrollPhysics(),
                                        child: Opacity(
                                          opacity: isFirstActive ? 0.0 : 1.0,
                                          child: Visibility(
                                            visible: !isFirstActive,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 30 - 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(height: 5, width: 64, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFEEEEEE))),
                                                  const SizedBox(height: 16),
                                                  AddressField(controller: _fromAddressController, hint: 'Откуда забрать?', icon: 'assets/icons/from.svg'),
                                                  Padding(padding: const EdgeInsets.only(left: 28 + 16), child: const Divider(height: 1, color: Color(0xFFEEEEEE))),
                                                  AddressField(controller: _toAddressController, hint: 'Куда доставить?', icon: 'assets/icons/to.svg'),

                                                  Row(
                                                    spacing: 8,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(child: SelectBoxSizeWidget(image: 'assets/icons/10_20_30_box.svg', title: 'Маленькая')),
                                                      Expanded(child: SelectBoxSizeWidget(image: 'assets/icons/20_50_40_box.svg', title: 'Средняя')),
                                                      Expanded(child: SelectBoxSizeWidget(image: 'assets/icons/30_80_60_box.svg', title: 'Большая')),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 64,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                            width: isFirstActive ? 164 : 64,
                                            child: _buildButton(
                                              iconPath: isFirstActive ? 'assets/icons/add.svg' : 'assets/icons/card.svg',
                                              text: isFirstActive ? 'Новый заказ' : null,
                                              isActive: isFirstActive,
                                              onTap: () {
                                                if (!isFirstActive) {
                                                  context.pushNamed('payment-details');
                                                  return;
                                                }
                                                _controller.forward();
                                              },
                                              needSvg: true,
                                              width: isFirstActive ? 164 : 64,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: AnimatedContainer(
                                              duration: const Duration(milliseconds: 300),
                                              curve: Curves.easeInOut,
                                              child: _buildButton(
                                                iconPath: 'assets/icons/order_history.svg',
                                                text: !isFirstActive ? 'Добавить детали' : null,
                                                isActive: !isFirstActive,
                                                onTap: () {
                                                  if (!isFirstActive) {
                                                    context.pushNamed('order-details');
                                                  }
                                                  context.pushNamed('order-history');
                                                },
                                                needSvg: isFirstActive,
                                                width: double.infinity,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                            width: 64,
                                            child: _buildButton(
                                              iconPath: isFirstActive ? 'assets/icons/profile.svg' : 'assets/icons/edit.svg',
                                              isActive: false,
                                              onTap: () {
                                                if (!isFirstActive) {
                                                  context.pushNamed('order-details');
                                                }
                                                context.pushNamed('profile');
                                              },
                                              needSvg: true,
                                              width: 64,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
