import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String _message;
  final String _userName;
  final String _imageUrl;
  final bool _isMe;
  final Key key;
  MessageBubble(this._message, this._userName, this._imageUrl, this._isMe,
      {required this.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              _isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color:
                      _isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft:
                          !_isMe ? Radius.circular(0) : Radius.circular(12),
                      bottomRight:
                          _isMe ? Radius.circular(0) : Radius.circular(12))),
              width: 140,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment:
                    _isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    _userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _isMe
                            ? Colors.black
                            : Theme.of(context)
                                .accentTextTheme
                                .headline1!
                                .color),
                  ),
                  Text(
                    _message,
                    style: TextStyle(
                        color: _isMe
                            ? Colors.black
                            : Theme.of(context)
                                .accentTextTheme
                                .headline1!
                                .color),
                    textAlign: _isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        ),
        Positioned(
            top: 0,
            left: _isMe ? null : 120,
            right: _isMe ? 120 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(_imageUrl),
            )),
      ],
      clipBehavior: Clip.none,
    );
  }
}
