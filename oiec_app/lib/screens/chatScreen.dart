import 'package:flutter/material.dart';
import 'package:oiec_app/components/MainLayout.dart';
import 'package:oiec_app/components/customContainer.dart';

import '../services/navigator.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: "Chat",
        body: Column(
          children: [
            CustomContainer(
                child: _ChatScreen(
                    asunto: "Chat 1",
                    contexto:
                        "El problema se resuelve de la siguiente manera...")),
            CustomContainer(
                child: _ChatScreen(
                    asunto: "Chat 2",
                    contexto: "Sí, comentame lo que necesites"))
          ],
        ));
  }
}

class _ChatScreen extends StatelessWidget {
  final String asunto;
  final String contexto;
  final Enrouter router = Enrouter.instance;
  _ChatScreen({required this.asunto, required this.contexto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Expanded(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text(asunto), Text(contexto, maxLines: 4,  
              overflow: TextOverflow.ellipsis,)],
      )),
      Expanded(child:
      IconButton(
        icon: const Icon(Icons.arrow_right_alt),
        onPressed: (){
          router.navigateToChatDetailScreen(context);
        },
      )
    )]));
  }
}
