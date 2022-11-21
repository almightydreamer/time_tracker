class ApiConstants {

  static String baseUrl = 'https://fitness-app-api.k8s.devebs.net/users';


  // // // ENDPOINTS FOR USER LOGGING API
  //

  static String usersUrl = '$baseUrl/users';

  static String loginEndpoint = ('$usersUrl/login');
  static String registerEndpoint = ('$usersUrl/register');
  static String profileEndpoint = ('$usersUrl/profile');
  static String refreshEndpoint = ('$usersUrl/refresh');

  //
  // // // ENDPOINTS FOR USER LOGGING API



  // // // ENDPOINTS FOR HOME ARTICLES API
  //

  static String workoutUrl = '$baseUrl/workout';

  static String goalsEndpoint = '$workoutUrl/goal';
  static String exercisesEndpoint = '$workoutUrl/exercise';

  //
  // // // ENDPOINTS FOR HOME ARTICLES API

}
