import 'package:flutter/material.dart';
import 'package:foodtruck/classes/meal.dart';

import '../meal_details_widgets/tab_selection.dart';

Column multipuleTabSelection(int margin, double width, int index, Meal meal,
    int tabIndex, Function selectTab, int tabIndex2, Function secondSelection) {
  return Column(
    children: [
      firstSelection(margin, width, index, meal, tabIndex, selectTab),
      SizedBox(
        height: 15,
      ),
      GestureDetector(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: margin.toDouble()),
          width: (width / meal.subSelection().length) - margin * 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: tabIndex2 == index + 1 ? Colors.grey : null),
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                '${meal.subSelection()[index].toString()}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color:
                        tabIndex2 == index + 1 ? Colors.black : Colors.white),
              ),
            ),
          ),
        ),
        onTap: () => secondSelection(index + 1),
      ),
    ],
  );
}
