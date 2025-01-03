import 'package:flutter/material.dart';
import 'package:foodloop/Entities/supermarket_entity.dart';
import 'package:foodloop/Views/utils/AppColor.dart';
import 'package:intl/intl.dart';

class SupermarketHorizontalCard  {
  static Card card(Supermarket sup, double distance) {
    String distanceLabel;
    if(distance < 1) {
      distanceLabel = "";
    } else {
      String distanceStr;
      if(distance < 1000) {
        distanceStr = NumberFormat("####").format(distance);
        distanceLabel = "$distanceStr m away!";
      } else if(distance / 1000 <= 2000) {
        distanceStr = NumberFormat("####").format(distance / 1000);
        distanceLabel = "$distanceStr km away!";
      } else {
        // distanceStr = NumberFormat("000E000").format(distance / 1000);
        distanceLabel = ">2000 km away!";
      }
    }
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                sup.imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    sup.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        distanceLabel,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.primary
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}