import 'package:flutter/material.dart';
import 'package:provisions_manager/pages/card_details.dart';
import 'package:provisions_manager/services/format_time.dart';

class MainCard extends StatefulWidget {
  const MainCard({
    super.key,
  });

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard>
    with SingleTickerProviderStateMixin {
  bool _isChecked = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation;

  Map<String, dynamic> cardDetails() {
    return {
      'title': 'Provision 1',
      'description': 'Na me be this o!',
      'lastUpdated':
          'Last Updated: ${FormatTime().formatDateTime(DateTime.now())}',
      'cardColor': Colors.amber[300]!,
      'dateCreated':
          'Date Created: ${FormatTime().formatDateTime(DateTime.now())}',
      'items': [
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
        'Item 5',
        'Item 6',
        'Item 7',
        'Item 8'
      ],
    };
  }

  // Map<String, dynamic> cardSettings = {
  //   'titleSize': 16,
  //   'titleColor': Colors.black,
  //   'subtitleSize': 10,
  //   'subtitleColor': Colors.grey[600],
  //   'descriptionColor': Colors.black,
  // };

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CardDetailsPage(
                    title: cardDetails()['title'],
                    description: cardDetails()['description'],
                    cardColor: cardDetails()['cardColor'],
                    dateCreated: DateTime.now(), // Corrected parameter
                    lastUpdated: DateTime.now(), // Corrected parameter
                    items: List<String>.from(cardDetails()['items']),
                  )),
        ).then((_) {
          _controller.reset();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.forward();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value * 2.0,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Card(
                  key: Key('1'),
                  color: Colors.amber[300]!,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: -10,
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
                          padding: const EdgeInsets.fromLTRB(50, 10, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cardDetails()['title'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    cardDetails()['description'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Text(
                            cardDetails()['dateCreated'].split(' ')[7],
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
