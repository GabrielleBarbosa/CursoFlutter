import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          !mine ?
          Padding(
            padding: EdgeInsets.only(right: 10),
            child:CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl']),

            ),
          ) : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: mine ? CrossAxisAlignment.end:CrossAxisAlignment.start,
              children: <Widget>[
                data['imgUrl'] != null ?
                    Image.network(data['imgUrl'], width: 250,)
                :
                    Text(
                      data['text'],
                      style: TextStyle(fontSize: 16),
                      textAlign: mine ? TextAlign.end
                          :
                                        TextAlign.start,
                    ),
                Text(
                    data['senderName'],
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)
                )
              ],
            ),
          ),
          mine ?
          Padding(
            padding: EdgeInsets.only(left: 10),
            child:CircleAvatar(
              backgroundImage: NetworkImage(data['senderPhotoUrl']),

            ),
          ) : Container(),
        ],
      ),
    );
  }
}
