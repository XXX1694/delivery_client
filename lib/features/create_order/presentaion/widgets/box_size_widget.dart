import 'package:delivery_client/features/create_order/presentaion/widgets/select_box_size_widget.dart';
import 'package:flutter/cupertino.dart';

enum BoxSizeType { small, medium, large }

class BoxSizeWidget extends StatefulWidget {
  const BoxSizeWidget({super.key});

  @override
  State<BoxSizeWidget> createState() => _BoxSizeWidgetState();
}

class _BoxSizeWidgetState extends State<BoxSizeWidget> {
  BoxSizeType? selectedBoxSizeType;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectBoxSizeWidget(
          isSelected: selectedBoxSizeType == BoxSizeType.small,
          onTap: () {
            selectedBoxSizeType = BoxSizeType.small;
            setState(() {});
          },
          image: 'assets/icons/10_20_30_box.svg',
          title: 'Маленькая',
        ),
        SizedBox(width: 8),
        SelectBoxSizeWidget(
          isSelected: selectedBoxSizeType == BoxSizeType.medium,
          onTap: () {
            selectedBoxSizeType = BoxSizeType.medium;
            setState(() {});
          },
          image: 'assets/icons/20_50_40_box.svg',
          title: 'Средняя',
        ),
        SizedBox(width: 8),
        SelectBoxSizeWidget(
          isSelected: selectedBoxSizeType == BoxSizeType.large,
          onTap: () {
            selectedBoxSizeType = BoxSizeType.large;
            setState(() {});
          },
          image: 'assets/icons/30_80_60_box.svg',
          title: 'Большая',
        ),
      ],
    );
  }
}
