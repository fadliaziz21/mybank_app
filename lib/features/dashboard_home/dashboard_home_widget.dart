import 'package:flutter/material.dart';

class DashboardMenu extends StatelessWidget {
  final String urlImage;
  final String menuName;

  const DashboardMenu({required this.urlImage, required this.menuName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            children: [
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage(
                        urlImage,
                      ),
                      height: 50,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    menuName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
