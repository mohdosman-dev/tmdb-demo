import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
  });

  final Widget? icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
