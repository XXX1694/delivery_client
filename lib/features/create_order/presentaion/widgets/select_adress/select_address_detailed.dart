import 'package:delivery_client/features/create_order/presentaion/widgets/route_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showSelectAddress(BuildContext context, TextEditingController fromAddressController) {
  final controller = DraggableScrollableController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFFfefefe),
    builder:
        (_) => DraggableScrollableSheet(
          controller: controller,
          expand: false,
          initialChildSize: 0.63,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (_, scrollController) => SingleChildScrollView(controller: scrollController, child: SelectAddressWidget(sheetController: controller)),
        ),
  );
}

class SelectAddressWidget extends StatefulWidget {
  const SelectAddressWidget({super.key, required this.sheetController});
  final DraggableScrollableController sheetController;

  @override
  State<SelectAddressWidget> createState() => _SelectAddressWidgetState();
}

class _SelectAddressWidgetState extends State<SelectAddressWidget> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  bool? isLanding;

  void _handlePointTap(bool landing) {
    final isSame = isLanding == landing;
    final shouldExpand = isLanding == null;
    setState(() => isLanding = isSame ? null : landing);
    widget.sheetController.animateTo(shouldExpand ? 0.9 : 0.63, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 600,
        child: Stack(
          children: [
            Column(
              children: [
                Container(margin: const EdgeInsets.symmetric(vertical: 14), height: 5, width: 64, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xFFEEEEEE))),
                if (isLanding == null || isLanding == true)
                  RouteEntryWidget(title: "Точка посадки", icon: "assets/icons/from.svg", addressController: _fromController, onTap: () => _handlePointTap(true)),
                if (isLanding == null) const SizedBox(height: 12),
                if (isLanding == null || isLanding == false)
                  RouteEntryWidget(title: "Пункт назначения", icon: "assets/icons/flag.svg", addressController: _fromController, onTap: () => _handlePointTap(false)),
                if (isLanding != null) const SizedBox(height: 20),
              ],
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 230,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child:
                    isLanding != null
                        ? SizedBox(
                          height: 200, // ограничение по высоте
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 20),
                            itemCount: 7,
                            itemBuilder: (_, index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 4), child: SvgPicture.asset("assets/icons/location.svg")),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Kabanbai Batyr 87", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                                        Text("Taugul-3 shagyn audany, Almaty", style: TextStyle(fontSize: 12, color: Color(0xFF9E9E9E))),
                                        Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider(height: 1, color: Color(0xFFEEEEEE))),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
