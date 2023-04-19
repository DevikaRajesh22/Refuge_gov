import 'package:flutter/material.dart';
import 'package:refuge_govt/widgets/custom_card.dart';

class DrawerButton extends StatefulWidget {
  final String label;
  final IconData iconData;
  final bool isSelected;
  final Function() onPressed;
  const DrawerButton({
    Key? key,
    required this.label,
    this.isSelected = false,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  State<DrawerButton> createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        _hover = true;
      }),
      onExit: (event) => setState(() {
        _hover = false;
      }),
      child: CustomCard(
        color:
            !(widget.isSelected || _hover) ? Colors.blue[50] : Colors.blue[900],
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                Icon(
                  widget.iconData,
                  color: (widget.isSelected || _hover)
                      ? Colors.white
                      : Colors.blue[900],
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    widget.label,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: !(widget.isSelected || _hover)
                              ? Colors.blue[900]
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
