import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class Faq extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Frequently asked questions'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          ExpandablePanel(
              header: Text('What is mental health', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              expanded: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
              // collapsed: Text('simply random text popular belief ....', softWrap: true, ),
              
            ),
            SizedBox(height: 10,),
            ExpandablePanel(
              header: Text('Just another title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              expanded: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
              // collapsed: Text('Contrary to popular belief... ', softWrap: true, ),
              
            ),
            SizedBox(height: 10,),
            ExpandablePanel(
              header: Text('Title Number 3', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              expanded: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
              // collapsed: Text('From 45 BC, making it ove...r', softWrap: true, ),
              
            ),
            
        ],),
      ),
    );
  }
}