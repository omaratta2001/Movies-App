class Movie{
   int id;
   String original_title;
   String overview;
   String poster_path;
  String backdrop_path;
  String title;
  num vote_average;



   Map<String, dynamic> toMap() {
     return {
       'id': this.id,
       'original_title': this.original_title,
       'overview': this.overview,
       'poster_path': this.poster_path,
       'backdrop_path': this.backdrop_path,
       'title': this.title,
       'vote_average': this.vote_average,
     };
   }

   factory Movie.fromMap(Map<String, dynamic> map) {
     return Movie(
       id: map['id'] as int,
       original_title: map['original_title'] as String,
       overview: map['overview'] as String,
       poster_path: map['poster_path'] as String,
       backdrop_path: map['backdrop_path'] as String,
       title: map['title'] as String,
       vote_average: map['vote_average'] as num,
     );
   }

   Movie({
    required this.id,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.backdrop_path,
    required this.title,
    required this.vote_average,
  });
}



