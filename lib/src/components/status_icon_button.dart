import 'package:flutter/material.dart';

enum Status { DONE, NOTDONE }

class StatusIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Status status;

  const StatusIconButton({super.key, this.onPressed, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.DONE:
        return _buildBody(
            Colors.green,
            const Icon(
              Icons.done,
              size: 20,
            ));
      case Status.NOTDONE:
        return _buildBody(
            Colors.red,
            const Icon(
              Icons.close,
              size: 20,
            ));
    }
  }

  Widget _buildBody(Color color, Icon icon) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
          width: 40,
          height: 40,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(8.0),
                foregroundColor: Colors.white,
                backgroundColor: color,
                fixedSize: const Size(40, 40)),
            child: icon,
          ),
        ));
  }
}
