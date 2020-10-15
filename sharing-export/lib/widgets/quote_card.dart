import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  QuoteCard({@required this.quote, this.author, this.backgroundImage});

  final String quote;
  final String author;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(backgroundImage),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                '\"$quote\"',
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              author,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
