import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thein_test/common/constants.dart';
import 'package:thein_test/models/exhibit.dart';

class ExhibitCard extends StatefulWidget {
  final Exhibit exhibit;
  ExhibitCard({
    Key? key,
    required this.exhibit,
  });

  @override
  State<StatefulWidget> createState() => ExhibitCardState();
}

class ExhibitCardState extends State<ExhibitCard> {
  List<Widget> _buildexhibitImages(photos) {
    List<Widget> images = [];
    for (var i = 0; i < photos.length; i++) {
      images.add(_buildImageBox(photos[i]));
    }
    return images;
  }

  Widget _buildImageBox(String image) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            image: NetworkImage(image),
            placeholder: const AssetImage('assets/img/tech.jpeg'),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/img/tech.jpeg', fit: BoxFit.cover);
            },
            fit: BoxFit.cover,
          ),
        ),
      ),
      );
  }


  Widget _buildexhibitsCard(n) {
    return Container(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 35.0,
            maxHeight: 160.0,
          ),
          child:ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      itemCount: n.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildImageBox(n[index]);
      })));
  }

  Widget _buildexhibitTitle() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Text(
          widget.exhibit.title,
          style: const TextStyle(
              fontWeight: exhibitTitleWeight,
              fontSize: exhibitTitleSize,
              fontFamily: shopTitleListFamily),
          textAlign: TextAlign.left,
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
                padding:
                    const EdgeInsets.only(top: 7, bottom: 7, left: 0, right: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildexhibitTitle(),
                    const SizedBox(
                      height: 5,
                    ),
                    _buildexhibitsCard(widget.exhibit.images),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))),
      ],
    );
  }
}
