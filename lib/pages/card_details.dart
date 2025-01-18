import 'package:flutter/material.dart';
import 'package:provisions_manager/services/format_time.dart';

class CardDetailsPage extends StatefulWidget {
  final String title;
  final String description;
  final DateTime dateCreated;
  final DateTime lastUpdated;
  final Color cardColor;
  final List<String> items;

  const CardDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.dateCreated,
    required this.lastUpdated,
    required this.cardColor,
    required this.items,
  });

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  bool _showDateCreated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          'Card Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Card(
            color: Colors.amber[300],
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    FormatTime().formatDateTime(widget.lastUpdated),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: SizedBox(
                      height: 200, // Provide a fixed height
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          return Text(
                            widget.items[index],
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showDateCreated = !_showDateCreated;
                      });
                    },
                    child: Text(
                      'Show Date created',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  if (_showDateCreated)
                    Text(
                      FormatTime().formatDateTime(widget.dateCreated),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
