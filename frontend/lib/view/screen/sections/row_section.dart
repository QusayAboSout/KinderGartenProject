import 'package:flutter/material.dart';
import 'package:frontend/model/section.dart';

class SectionRowModal extends StatelessWidget {
  const SectionRowModal(this._sectionDto, {super.key});

  final SectionDto _sectionDto;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30,
        ),
        title: Text(
          '${_sectionDto.name}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.quora_rounded,
        ),
        onTap: () {},
      ),
    );
  }
}
