import 'package:flutter/material.dart';
import 'package:test_container/configs/network.dart';
import 'package:test_container/models/event.dart';

class EventCard extends StatefulWidget {
  final Event event;
  final String title;
  const EventCard({super.key, required this.event, required this.title});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Title: ${widget.title}"),
                  Text("Date Time: ${widget.event.dateTime}"),
                  Text("Text: ${widget.event.text}"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Image.network(baseStorage + widget.event.imagePath!, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Icon(Icons.no_photography, size: 100))),
          ),
        ]
      )
    );
  }
}