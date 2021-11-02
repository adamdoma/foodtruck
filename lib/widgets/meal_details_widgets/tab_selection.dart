import 'package:flutter/material.dart';

import '../../classes/meal.dart';

GestureDetector firstSelection(int margin, double width, int index, Meal meal,
    int tabIndex, Function selectTab) {
  return GestureDetector(
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: margin.toDouble()),
      width: (width / meal.selectionList().length) - margin * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: tabIndex == index + 1 ? Colors.grey : null),
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            '${meal.selectionList()[index].toString()}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: tabIndex == index + 1 ? Colors.black : Colors.white),
          ),
        ),
      ),
    ),
    onTap: () => selectTab(index + 1),
  );
}
