import 'package:flutter/material.dart';
import 'package:qlvbdh/src/presentations/search_result.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.blue.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        )
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchResultScreen()));
      },
      child: const Center(
        child: Text(
          'Tìm kiếm',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30),
        ),
      ),
    );
  }
}