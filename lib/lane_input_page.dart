import 'package:flutter/material.dart';
import 'package:test_container/home_page.dart';

class LaneInputPage extends StatefulWidget {
  const LaneInputPage({super.key});

  @override
  _LaneInputPageState createState() => _LaneInputPageState();
}

class _LaneInputPageState extends State<LaneInputPage> {
  final TextEditingController _laneIdController = TextEditingController();

  void _submitLaneId() {
    String laneId = _laneIdController.text;
    // Handle the submitted lane ID as needed
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomePage(laneId: laneId),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _laneIdController.text = '17';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Lane ID'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  controller: _laneIdController,
                  decoration: const InputDecoration(
                    labelText: 'Lane ID',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitLaneId,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
