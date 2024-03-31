import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tambaletra/const/colors.dart';
import 'package:tambaletra/managers/audio.dart';

class SettingsDialog extends ConsumerWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioState = ref.watch(backgroundAudioProvider);

    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(1),
      content: Container(
        width: MediaQuery.of(context).size.width * .75,
        height: 400,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.orange.shade300,
            width: 8,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            TextField(
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: '\"Player Name\"',
                prefixIcon: Icon(Icons.person),
                suffixIcon: TextButton(
                  onPressed: () {
                    print("tap");
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ),
              maxLength: 12,
            ),
            SizedBox(
              height: 15,
            ),
            buildAudioSetting(
              context,
              label: 'Music',
              icon: audioState != AudioState.playing
                  ? Icons.music_off_rounded
                  : Icons.music_note_rounded,
              onTap: () {
                final notifier = ref.read(backgroundAudioProvider.notifier);
                notifier.toggleBackgroundAudio();
              },
            ),
            SizedBox(
              height: 15,
            ),
            buildAudioSetting(
              context,
              label: 'Sound FX',
              icon: Icons.music_note_rounded, // Placeholder icon
              onTap: () {
                // Implement sound FX functionality
              },
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400,
                ),
                child: Text(
                  "Close",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAudioSetting(BuildContext context,
      {required String label,
      required IconData icon,
      required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(45),
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
