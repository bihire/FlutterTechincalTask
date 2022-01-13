import 'package:flutter/material.dart';
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
    return FadeInImage(
      image: NetworkImage(image),
      placeholder: const AssetImage('assets/img/tech.jpeg'),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset('assets/img/tech.jpeg', fit: BoxFit.fitWidth);
      },
      fit: BoxFit.cover,
    );
  }


  Widget _buildexhibitsCard(n) {
    return GridView.count(
        mainAxisSpacing: 4,
        crossAxisSpacing: 2,
        crossAxisCount: 3,
        physics:
            const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
        shrinkWrap: true, // You won't see infinite size error
        children: _buildexhibitImages(n));
  }

  Widget _buildexhibitTitle() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                    const EdgeInsets.only(top: 7, bottom: 7, left: 7, right: 0),
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
