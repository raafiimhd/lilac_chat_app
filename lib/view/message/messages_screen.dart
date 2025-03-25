import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_chat_app/controller/message_controller.dart';
import 'package:lilac_chat_app/view/chat/chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    final MessagesController controller = Get.put(MessagesController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
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
            Obx(() {
              if (controller.contacts.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SizedBox(
                height: 100.rh,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = controller.contacts[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 12.rt),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30.rs,
                            backgroundImage: contact.profilePhotoUrl.isNotEmpty
                                ? NetworkImage(contact.profilePhotoUrl)
                                : null,
                            child: contact.profilePhotoUrl.isEmpty
                                ? const Icon(Icons.person,
                                    size: 30, color: Colors.grey)
                                : null,
                          ),
                          SizedBox(height: 4.rt),
                          Text(
                            contact.name,
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
              );
            }),
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
            Obx(() {
              if (controller.contacts.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: controller.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = controller.contacts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 24.rs,
                        backgroundImage: contact.profilePhotoUrl.isNotEmpty
                            ? NetworkImage(contact.profilePhotoUrl)
                            : null,
                        child: contact.profilePhotoUrl.isEmpty
                            ? const Icon(Icons.person,
                                size: 24, color: Colors.grey)
                            : null,
                      ),
                      title: Text(
                        contact.name,
                        style: TextStyle(
                          fontSize: 14.rt,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // trailing: Text(
                      //   contact.message_received_from_partner_at,
                      //   style: TextStyle(
                      //     fontSize: 12.rt,
                      //     color: Colors.grey.shade500,
                      //   ),
                      // ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            senderId: id,
                            receiverId: contact.id,
                            message: contact,
                          ),
                        ));
                      },
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
