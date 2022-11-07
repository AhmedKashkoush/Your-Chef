import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:your_chief/Core/Constants/app_colors.dart';

class SelectableButton<T> extends StatelessWidget {
  final String title;
  final String? svg;
  final T value;
  final T currentValue;
  final void Function(T?)? onChanged;
  const SelectableButton({
    Key? key,
    required this.title,
    this.svg,
    required this.value,
    required this.currentValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              onChanged?.call(value);
            },
            child: Container(
              padding: const EdgeInsets.all(22),
              color: value == currentValue
                  ? AppColors.primary.withOpacity(0.3)
                  : Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: value == currentValue
                        ? const TextStyle(color: AppColors.secondary)
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (svg != null)
                    SvgPicture.asset(
                      svg!,
                      height: MediaQuery.of(context).size.height * 0.1,
                      color: value == currentValue
                          ? AppColors.secondary
                          : Theme.of(context).iconTheme.color,
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Radio(
                    activeColor: AppColors.secondary,
                    value: value,
                    groupValue: currentValue,
                    onChanged: onChanged,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
