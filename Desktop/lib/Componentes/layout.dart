import 'package:flutter/material.dart';

class LayoutTelas extends StatelessWidget {
  final Widget body;
  final Widget? searchBar;
  final Widget? filter;
  const LayoutTelas({
    Key? key,
    required this.body,
    this.searchBar,
    this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bodySize = MediaQuery.of(context).size.height * 0.74;
    if (searchBar == null) {
      bodySize = bodySize + MediaQuery.of(context).size.height * 0.08;
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.transparent),
            color: const Color(0xFF3A1E7A),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Color(0xFF2C1C50),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                if (filter != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 13, left: 13, top: 12),
                    child: filter,
                  ),
                if (searchBar != null)
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    padding: const EdgeInsets.only(right: 13, left: 13),
                    child: searchBar,
                  ),
                // _buildSearchBar(),
                Container(
                  height: bodySize,
                  padding: const EdgeInsets.only(right: 13, left: 13, top: 15),
                  child: body,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
