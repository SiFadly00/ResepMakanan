import 'package:flutter/material.dart';
import 'package:resep_makanan/views/detail_video.dart';

// class ResepCard extends StatelessWidget {
//   final String title;
//   final String rating;
//   final String cookTime;
//   final String thumbnailUrl;

//   const ResepCard(
//       {required this.title,
//       required this.rating,
//       required this.cookTime,
//       required this.thumbnailUrl});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class ResepCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final String videoUrl;

  const ResepCard(
      {super.key,
      required this.title,
      required this.rating,
      required this.cookTime,
      required this.thumbnailUrl,
      required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: const Offset(0.0, 10.0),
                blurRadius: 10.0,
                spreadRadius: -6.0),
          ],
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35), BlendMode.multiply),
              image: NetworkImage(thumbnailUrl),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 19),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: videoUrl != 'noVideo' ? true : false,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailVideo(
                                      videoUrl: videoUrl,
                                    )))
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.play_circle_fill_rounded,
                            color: Colors.yellow,
                            size: 10,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text('Play video')
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(cookTime)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
