```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData, handle potential JSON decoding errors
      print('Data fetched successfully: $jsonData');
    } else {
      //Provide specific error information based on status code
      throw Exception('Failed to load data. Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}');
    }
  } on FormatException catch (e) {
    print('Error decoding JSON: $e');
  } on http.ClientException catch (e) {
    print('Network error: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```