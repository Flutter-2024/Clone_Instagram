import 'package:clone_instagram/constants/media_utils.dart';
import 'package:clone_instagram/data/data.dart';
import 'package:clone_instagram/model/audio_result.dart';
import 'package:flutter/material.dart';

class AudioResultScreen extends StatefulWidget {
  const AudioResultScreen({super.key});

  @override
  State<AudioResultScreen> createState() => _AudioResultScreenState();
}

class _AudioResultScreenState extends State<AudioResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: DataAudio.listAudio.length,
        itemBuilder: (context, index) {
          return _itemAudio(DataAudio.listAudio[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 16.0,
            color: Colors.transparent,
          );
        },
      ),
    );
  }

  Widget _itemAudio(AudioResult audioResult) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            audioResult.avatar,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  audioResult.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  "${audioResult.author} * ${audioResult.reels} reels",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            )
        ),
      ],
    );
  }
}
