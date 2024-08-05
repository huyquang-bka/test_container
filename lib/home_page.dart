import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:test_container/components/camera.dart';
import 'package:test_container/models/event.dart';
import 'package:test_container/utils/mqtt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.laneId});
  final String laneId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MqttServerClient client;
  late String mqttBroker;
  late MQTTClient mqttClient;

  //MQTT
  String broker = '192.168.1.194';
  int port = 1883;
  String username = 'admin';
  String password = 'admin';
  String topic = "";
  // generate random client id from current time
  String clientId = "mobile-${DateTime.now().millisecondsSinceEpoch}";

  //List of events
  List<Event> events = List.generate(7, (index) => Event(functionId: index + 1, imagePath: "", dateTime: "?", text: "?"));


  @override
  void initState() {
    super.initState();
    _loadTopic();
  }

  @override
  void dispose() {
    mqttClient.disconnect();
    super.dispose();
  }

  void _loadTopic() async {
    // Assume the topic is the same as the clientId
    setState(() {
      topic = "container/${widget.laneId}";
      print("Topic: $topic");
    });
    _connectMQTT();
  }

  void _connectMQTT() async {
    print("Topic: $topic");
    mqttClient = MQTTClient(
      broker: broker,
      port: port,
      clientId: clientId,
      username: username,
      password: password,
      topic: topic,
      onMessage: _onMessage,
    );
    await mqttClient.connect();
  }

  void _onMessage(String topic, String message) {
    Event event = Event.fromString(message);
    setState(() {
      for (int i = 0; i < events.length; i++) {
        if (events[i].functionId == event.functionId) {
          events[i] = event;
          break;
        }
      }
      print("Event: ${event.toJson()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: CameraView(events: events),
    );
  }
}
