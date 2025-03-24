import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:lilac_chat_app/view/chat/chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {
        'name': 'Christina',
        'image': 'https://randomuser.me/api/portraits/women/1.jpg',
      },
      {
        'name': 'Patricia',
        'image': 'https://randomuser.me/api/portraits/women/2.jpg',
      },
      {
        'name': 'Celestine',
        'image': 'https://randomuser.me/api/portraits/women/3.jpg',
      },
      {
        'name': 'Celestine',
        'image': 'https://randomuser.me/api/portraits/women/4.jpg',
      },
      {
        'name': 'Elizabeth',
        'image': 'https://randomuser.me/api/portraits/women/5.jpg',
      },
    ];

    final List<Map<String, String>> messages = [
      {
        'name': 'Regina Bearden',
        'image': 'https://randomuser.me/api/portraits/women/6.jpg',
        'time': '10:00 AM',
      },
      {
        'name': 'Rhonda Rivera',
        'image': 'https://randomuser.me/api/portraits/women/7.jpg',
        'time': '10:00 AM',
      },
      {
        'name': 'Mary Gratton',
        'image': 'https://randomuser.me/api/portraits/women/8.jpg',
        'time': '10:00 AM',
      },
      {
        'name': 'Annie Medved',
        'image': 'https://randomuser.me/api/portraits/women/9.jpg',
        'time': '10:00 AM',
      },
      {
        'name': 'Regina Bearden',
        'image': 'https://randomuser.me/api/portraits/women/10.jpg',
        'time': '10:00 AM',
      },
    ];

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
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contacts (Horizontal Scroll)
            SizedBox(
              height: 100.rh,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12.rt),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30.rs,
                          // backgroundImage: CachedNetworkImageProvider(
                          //   contacts[index]['image']!,
                          // ),
                        ),
                        SizedBox(height: 4.rt),
                        Text(
                          contacts[index]['name']!,
                          style: TextStyle(
                            fontSize: 12.rt,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.rh),

            // Search Box
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.rt, horizontal: 16.rt),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.rs),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 24.rh),

            // Chat Section Title
            Text(
              'Chat',
              style: TextStyle(
                fontSize: 16.rt,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12.rh),

            // Chat List
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 24.rs,
                      // backgroundImage: CachedNetworkImageProvider(
                      //   messages[index]['image']!,
                      // ),
                    ),
                    title: Text(
                      messages[index]['name']!,
                      style: TextStyle(
                        fontSize: 14.rt,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Text(
                      messages[index]['time']!,
                      style: TextStyle(
                        fontSize: 12.rt,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}