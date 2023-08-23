// ignore_for_file: constant_identifier_names

const String BASE_URL = "https://api.themoviedb.org/3";
const String BASE_IMAGE_URL = "https://image.tmdb.org/t/p/original/";
const String API_KEY = "5672bc9133df3288d1407b34c2b09fc5";

const double defaultPadding = 16.0;

class ApiConstants {
  static const int PAGE_SIZE = 20;
  // Movie endpoints
  /// Get the list of trending movies on TMDb. This list updates daily.
  static const String POPULAR_MOVIES = "/trending/movie/week";

  /// Get the list of genres on TMDb. This list updates daily.
  static const String GENRE = "/genre/movie/list";

  /// Get the list of upcoming movies on TMDb. This list updates daily.
  static const String UPCONING_MOVIES = "/movie/upcoming";

  /// Get movie details from movie id
  static const String MOVIE_DETAILS = "/movie/%1\$";

  /// Get actors from the movie
  static const String ACTORS = "/movie/%1\$/credits";
}
