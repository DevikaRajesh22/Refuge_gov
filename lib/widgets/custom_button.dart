import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final IconData? icon;
  final Color? buttonColor, iconColor, labelColor;
  final double elevation;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.buttonColor,
    this.iconColor,
    this.labelColor,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor ?? Colors.white,
      elevation: elevation,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: icon != null ? 10 : 20,
            top: 10,
            bottom: 10,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: icon != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: labelColor,
                    ),
              ),
              SizedBox(
                width: icon != null ? 5 : 0,
              ),
              icon != null
                  ? Icon(
                      icon!,
                      color: iconColor,
                      size: 20,
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
