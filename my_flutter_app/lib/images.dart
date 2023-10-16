import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

class BgImages extends StatefulWidget{
  const BgImages({super.key});
  


  
  @override
  State<StatefulWidget> createState() => ImageExample();


}
class ImageExample extends  State<BgImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Images Gallery"),
      ),
      body: Center(
       child: ListView(
        children: [
          ExtendedImage.network(
            'https://images.unsplash.com/photo-1515488764276-beab7607c1e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1895&q=80',
          // cache: true, (by default caches image)
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),

            CachedNetworkImage(
          imageUrl: 'https://picsum.photos/id/7/250/250',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const ElevatedButton(
                  onPressed: null,
                  child: Text('disabled-ElevatedButton'),
                  
                ),
                 const LinearProgressIndicator(),
                 const Divider(),
                 const Text('CircularProgressIndicator'),
                 const Center(child: CircularProgressIndicator()),
                 const Divider(),
                    
        ],
       )
      ),
    );
    
  }

}