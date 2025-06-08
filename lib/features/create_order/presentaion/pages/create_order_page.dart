import 'package:delivery_client/features/create_order/presentaion/widgets/box_size_widget.dart';
import 'package:delivery_client/features/create_order/presentaion/widgets/courier_search_widget.dart';
import 'package:delivery_client/features/orders_history/presentations/pages/orders_history_page.dart';
import 'package:delivery_client/features/profile/presentations/pages/profile_page.dart';
import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/colors.dart';
import '../widgets/address_field.dart';



enum ActiveTab { newOrder, orderHistory, profile, orderDetails }

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


  ActiveTab _activeTab = ActiveTab.newOrder;



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
      backgroundColor: Color(0xFFf4f5ff),
      body: Stack(
        children: [
          _activeTab == ActiveTab.profile
              ? ProfilePage()
              : _activeTab == ActiveTab.orderHistory
              ? OrdersHistoryPage()
              : Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey,
                child: DGisMap(
                  token: 'c1f433fd-d3a6-42f5-a27a-b53169c09a25',
                  initialCameraPosition: CameraPosition(position: Position(lat: 43.2380, long: 76.8829), zoom: 17.0),
                  theme: MapTheme.LIGHT,
                ),
              ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 64,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_activeTab == ActiveTab.orderDetails || _activeTab == ActiveTab.newOrder)
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              _controller.reverse();

                              _activeTab = ActiveTab.newOrder;
                            },
                            child: Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(100)),
                              child: Center(child: SvgPicture.asset('assets/icons/left_arrow.svg')),
                            ),
                          ),
                        if (_activeTab == ActiveTab.orderDetails || _activeTab == ActiveTab.newOrder)
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              _controller.reverse();

                              _activeTab = ActiveTab.newOrder;
                            },
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
                        width: containerWidth,
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xFFEEEEEE)), borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_activeTab == ActiveTab.orderDetails)
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
                                        padding: const EdgeInsets.symmetric(horizontal: 18),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(height: 5, width: 64, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFEEEEEE))),
                                            const SizedBox(height: 16),
                                            AddressField(controller: _fromAddressController, hint: 'Откуда забрать?', icon: 'assets/icons/from.svg'),
                                            const Padding(padding: EdgeInsets.only(left: 44), child: Divider(height: 1, color: Color(0xFFEEEEEE))),
                                            AddressField(controller: _toAddressController, hint: 'Куда доставить?', icon: 'assets/icons/to.svg'),
                                            const SizedBox(height: 16),
                                            BoxSizeWidget(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  width: _activeTab == ActiveTab.newOrder ? 164 : 64,
                                  child: _buildButton(
                                    iconPath: _activeTab == ActiveTab.orderDetails ? 'assets/icons/card.svg' : 'assets/icons/add.svg',
                                    text: _activeTab == ActiveTab.newOrder ? 'Новый заказ' : null,
                                    isActive: _activeTab == ActiveTab.newOrder,
                                    onTap: () {
                                      if (_activeTab == ActiveTab.orderDetails) {
                                        context.pushNamed('payment-details');
                                        return;
                                      }
                                      setState(() {
                                        _activeTab = ActiveTab.orderDetails;
                                      });
                                      _controller.forward();
                                    },
                                    needSvg: true,
                                    width: _activeTab == ActiveTab.newOrder ? 164 : 64,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                AnimatedContainer(
                                  width: _activeTab == ActiveTab.orderHistory || _activeTab == ActiveTab.orderDetails ? 164 : 64,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  child: _buildButton(
                                    iconPath: 'assets/icons/order_history.svg',
                                    text:
                                        _activeTab == ActiveTab.orderHistory
                                            ? 'История'
                                            : _activeTab == ActiveTab.orderDetails
                                            ? 'Добавить детали'
                                            : null,
                                    isActive: _activeTab == ActiveTab.orderHistory || _activeTab == ActiveTab.orderDetails,
                                    onTap: () {
                                      if (_activeTab == ActiveTab.orderDetails) {
                                        context.pushNamed('order-details');
                                        return;
                                      }
                                      setState(() {
                                        _activeTab = ActiveTab.orderHistory;
                                      });
                                    },
                                    needSvg: _activeTab == ActiveTab.orderDetails ? false : true,
                                    width: _activeTab == ActiveTab.orderHistory || _activeTab == ActiveTab.orderDetails ? 164 : 64,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  width: _activeTab == ActiveTab.profile ? 164 : 64,
                                  child: _buildButton(
                                    iconPath: _activeTab == ActiveTab.orderDetails ? 'assets/icons/edit.svg' : 'assets/icons/profile.svg',
                                    text: _activeTab == ActiveTab.profile ? 'Профиль' : null,
                                    isActive: _activeTab == ActiveTab.profile,
                                    onTap: () {
                                      if (_activeTab == ActiveTab.orderDetails) {
                                        context.pushNamed('order-details');
                                        return;
                                      }
                                      setState(() {
                                        _activeTab = ActiveTab.profile;
                                      });

                                      // context.pushNamed('profile');
                                    },
                                    needSvg: true,
                                    width: _activeTab == ActiveTab.profile ? 164 : 64,
                                  ),
                                ),
                              ],
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


void showCourierSearchBottom(BuildContext context) {
  showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: const Color(0xFFfefefe), builder: (_) => CourierSearchWidget());
}

