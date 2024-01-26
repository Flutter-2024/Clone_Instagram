import 'package:flutter/material.dart';

class CustomNoteOfAccountWidget extends StatelessWidget {
  final String noteContent;
  const CustomNoteOfAccountWidget({
    Key? key,
    this.noteContent = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 112,
            maxHeight: 72,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              noteContent,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
        ),
      ),
    );
  }
}