import 'package:flutter/material.dart';

import 'custom_button.dart';

class HorizontalSelector extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final int selectedItemId;
  final String label;
  final Function(int) onSelect;
  final Color color;
  const HorizontalSelector({
    super.key,
    required this.items,
    this.selectedItemId = 0,
    required this.label,
    this.color = Colors.blue,
    required this.onSelect,
  });

  @override
  State<HorizontalSelector> createState() => _HorizontalSelectorState();
}

class _HorizontalSelectorState extends State<HorizontalSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              CustomButton(
                color: widget.selectedItemId == 0
                    ? widget.color
                    : widget.color.withOpacity(.1),
                labelColor:
                    widget.selectedItemId == 0 ? Colors.white : widget.color,
                onPressed: () {
                  widget.onSelect(0);
                },
                label: 'All ${widget.label}',
              ),
              const SizedBox(width: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CustomButton(
                  color: widget.selectedItemId == widget.items[index]['id']
                      ? widget.color
                      : widget.color.withOpacity(.1),
                  labelColor: widget.selectedItemId == widget.items[index]['id']
                      ? Colors.white
                      : widget.color,
                  onPressed: () {
                    widget.onSelect(widget.items[index]['id']);
                  },
                  label: widget.items[index]['name'],
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: widget.items.length,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
