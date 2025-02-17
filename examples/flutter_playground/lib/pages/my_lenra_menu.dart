import 'package:flutter/material.dart';
import 'package:lenra_components/lenra_components.dart';

class MyLenraMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyLenraMenuState();
}

class _MyLenraMenuState extends State<MyLenraMenu> {
  List<bool> selectedItems = [false, false];

  @override
  Widget build(BuildContext context) {
    return LenraFlex(
      direction: Axis.vertical,
      children: [
        // Basic LenraMenu
        LenraMenu(
          items: [
            LenraMenuItem(
              text: "menu item",
              onPressed: () => {},
            ),
            LenraMenuItem(
              text: "selected menu item",
              isSelected: true,
              onPressed: () => {},
            ),
          ],
        ),

        SizedBox(
          width: double.infinity,
          child: LenraMenu(
            items: [
              LenraMenuItem(
                text: "Fill Parent item",
                onPressed: () => {},
              ),
              LenraMenuItem(
                text: List.filled(100, "Long ").join(),
                isSelected: true,
                onPressed: () => {},
              ),
            ],
          ),
        ),

        // Interactive LenraMenu
        SizedBox(
          width: 600,
          child: LenraMenu(
            items: [
              LenraMenuItem(
                text: "Coffee",
                isSelected: selectedItems[0],
                onPressed: () => {setState(() => selectedItems[0] = !selectedItems[0])},
              ),
              LenraMenuItem(
                text: "Water",
                isSelected: selectedItems[1],
                onPressed: () => {setState(() => selectedItems[1] = !selectedItems[1])},
              ),
            ],
          ),
        ),

        // Disabled LenraMenu
        LenraMenu(
          items: [
            LenraMenuItem(
              text: "menu item",
              disabled: true,
              onPressed: () => {},
            ),
            LenraMenuItem(
              text: "selected menu item",
              disabled: true,
              isSelected: true,
              onPressed: () => {},
            ),
          ],
        ),

        // Custom Icon LenraMenu
        LenraMenu(
          items: [
            LenraMenuItem(
              icon: const Icon(
                Icons.airplanemode_active,
                color: Colors.white,
                size: 16,
              ),
              isSelected: true,
              text: "custom icon",
              onPressed: () => {},
            ),
          ],
        ),
        // Custom children
        const Text("Custom children"),
        LenraMenu(
          items: const [
            Text("My item 1"),
            Text("My item 2"),
            Text("My item 3"),
          ],
        ),
      ],
    );
  }
}
