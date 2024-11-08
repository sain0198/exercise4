import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  const url = 'https://random-data-api.com/api/users/random_user?size=8';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List users = jsonDecode(response.body);

      for (var user in users) {
        print('${user['uid']} - ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed to fetch user data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
