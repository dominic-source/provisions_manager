import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text(
          'Welcome to Provisions Manager',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB clicked');
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MainCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class MainCard extends StatefulWidget {
  const MainCard({
    super.key,
  });

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  bool _isChecked = false;
  bool _showDateCreated = false;

  final DateTime _dateCreated = DateTime.now();
  final DateTime _dateUpdated = DateTime.now();
  final Color _cardColor = Colors.amber[300]!;

  // Map<String, dynamic> cardSettings = {
  //   'titleSize': 16,
  //   'titleColor': Colors.black,
  //   'subtitleSize': 10,
  //   'subtitleColor': Colors.grey[600],
  //   'descriptionColor': Colors.black,
  // };

  String _formatDateTime(DateTime dateTime) {
    return DateFormat(
            'EEEE, d\'${_getDaySuffix(dateTime.day)}\' of MMMM \'at\' h:mma')
        .format(dateTime);
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key('1'),
      color: _cardColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 0,
              child: Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: Provision 1',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Last Updated: ${_formatDateTime(_dateUpdated)}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Items purchased on ${_formatDateTime(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    '-Item 1\n- Item2\n- Item 3',
                    style: TextStyle(
                      fontSize: 14,
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
                      'Date Created: ${_formatDateTime(_dateCreated)}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
