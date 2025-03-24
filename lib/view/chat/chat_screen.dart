import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.rs,
              // backgroundImage:const  CachedNetworkImageProvider(
              //   'https://randomuser.me/api/portraits/women/6.jpg',
              // ),
            ),
             SizedBox(width: 12.rw),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Regina Bearden',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.rt,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                     Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 10.rt,
                    ),
                     SizedBox(width: 4.rw),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12.rt,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Date label
           Padding(
            padding: EdgeInsets.symmetric(vertical: 8.rt),
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 12.rt,
                color: Colors.grey,
              ),
            ),
          ),

          // Chat bubble (right-aligned)
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin:  EdgeInsets.symmetric(horizontal: 16.rt, vertical: 4.rt),
              padding:
                   EdgeInsets.symmetric(horizontal: 12.rt, vertical: 8.rt),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(16.rs),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Text(
                    'Hi',
                    style: TextStyle(
                      fontSize: 14.rt,
                      color: Colors.black,
                    ),
                  ),
                   SizedBox(height: 4.rh),
                  Text(
                    '10:00 AM',
                    style: TextStyle(
                      fontSize: 10.rt,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          // Message Input Bar
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 16.rt, vertical: 8.rt),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                // Emoji Icon
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined,
                      color: Colors.grey),
                  onPressed: () {
                    // Handle emoji selection
                  },
                ),

                // Input Field
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Happy Birthday',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding:
                           EdgeInsets.symmetric(horizontal: 16.rt),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.rs),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // Send Button
                 SizedBox(width: 8.rw),
                Container(
                  padding:  EdgeInsets.all(10.rt),
                  decoration:const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child:  Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20.rt,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
