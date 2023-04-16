import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_era_app/Features/home_page/data/models/movie_model.dart';
import '../../../../../constants.dart';

class ListViewItem extends StatelessWidget {

  final void Function()? onTap;
  final Movie movie;
  const ListViewItem({required this.movie,Key? key,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 2.6/4,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                imageUrl: imageUrlPath+movie.posterPath.toString(),
                errorWidget: (context, url, error) => Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.error,
                      ),
                      Text("no Image Available",textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
          ),

        ),
      ),
    );
  }
}