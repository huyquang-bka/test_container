import 'package:flutter/material.dart';
import 'package:test_container/components/event_card.dart';
import 'package:test_container/models/event.dart';

class CameraView extends StatelessWidget {
  final List<Event> events;
  CameraView({super.key, required this.events});

  final Map<int, String> title = {1: "Front", 2: "Rear", 3: "Top", 4: "Right", 5: "Left", 6: "Head", 7: "Tail"};

  @override
  Widget build(BuildContext context) {
    // 2 rows, 3 columns
    return Column(
      children: [
        for (int i = 0; i < 2; i++)
          Expanded(
            child: Row(
              children: [
                for (int j = 0; j < 3; j++)
                  Expanded(
                    child: EventCard(event: events[i * 3 + j + 1], title: title[i * 3 + j + 2].toString()),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}