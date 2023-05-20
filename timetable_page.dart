import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 88, 212, 243),
              Color.fromARGB(255, 48, 163, 167),
              Color.fromARGB(255, 6, 133, 133)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Timetable',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Table(
                border: TableBorder.all(
                  color: Colors.black,
                  width: 1,
                ),
                children: [
                  TableRow(
                    children: [
                      buildTableHeaderCell('Time'),
                      buildTableHeaderCell('Sunday'),
                      buildTableHeaderCell('Monday'),
                      buildTableHeaderCell('Tuesday'),
                      buildTableHeaderCell('Wednesday'),
                      buildTableHeaderCell('Thursday'),
                    ],
                  ),
                  buildTableRow(
                    '8:00 AM - 9:00 AM',
                    'DL',
                    'CM',
                    'COA',
                    'AD',
                    'TIS',
                  ),
                  buildTableRow(
                    '9:00 AM - 10:00 AM',
                    'SP',
                    'TCS',
                    'SAD',
                    'TS',
                    'ITE',
                  ),
                  buildTableRow(
                    '10:00 AM - 11:00 AM',
                    'COA',
                    'COA',
                    'WP',
                    'WP',
                    'IP',
                  ),
                  buildTableRow(
                    '11:00 AM - 12:00 PM',
                    'DS',
                    'DS',
                    'PT1',
                    'CN',
                    'CN LAB',
                  ),
                  buildTableRow(
                    '12:00 PM - 1:00 PM',
                    'History',
                    'PT-1',
                    'CI',
                    'CM',
                    'TCS',
                  ),
                  buildTableRow(
                    '1:00 PM - 2:00 PM',
                    'Subject 1',
                    'Subject 2',
                    'PT-1',
                    'Subject 4',
                    'Subject 5',
                  ),
                  buildTableRow(
                    '2:00 PM - 3:00 PM',
                    'Subject 6',
                    'Subject 7',
                    'Subject 8',
                    'Subject 9',
                    'Subject 10',
                  ),
                  buildTableRow(
                    '3:00 PM - 4:00 PM',
                    'Subject 11',
                    'Subject 12',
                    'Subject 13',
                    'Subject 14',
                    'Subject 15',
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the homepage
                },
                child: Text('Back to Homepage'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableCell buildTableHeaderCell(String text) {
    return TableCell(
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.grey[200],
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  TableRow buildTableRow(
    String time,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
  ) {
    return TableRow(
      children: [
        buildTableCell(time),
        buildTableCell(sunday),
        buildTableCell(monday),
        buildTableCell(tuesday),
        buildTableCell(wednesday),
        buildTableCell(thursday),
      ],
    );
  }

  TableCell buildTableCell(String text) {
    return TableCell(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(text),
      ),
    );
  }
}
