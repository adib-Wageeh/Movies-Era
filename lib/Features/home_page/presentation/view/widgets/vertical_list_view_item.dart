import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_era_app/Features/home_page/data/models/movie_model.dart';
import '../../../../../core/utils/go_route.dart';
import '../../../../../core/utils/styles.dart';
import 'item_data_row.dart';
import 'list_view_item.dart';

class VerticalListViewItem extends StatelessWidget {
  final Movie movie;
  const VerticalListViewItem({required this.movie,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: (){

          GoRouter.of(context).push(GoRouteClass.detailsScreen,
          extra: movie
          );
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
          child: Row(
            children: [
              ListViewItem(
                movie: movie,
                  onTap: (){
                  }
              ),
              const SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6
                        ,child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,movie.originalTitle.toString(),style: Styles.textStyle20)),
                    const SizedBox(height: 3,),
                    Text(movie.releaseDate.toString(),style: Styles.textStyle14.copyWith(color: Colors.grey)),
                    Row(
                      children: [
                        Text((movie.adult == false)?"PG-13":"NC-17",style: Styles.textStyle16),
                        const Spacer(),
                        ItemDataRow(movie:movie),
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

