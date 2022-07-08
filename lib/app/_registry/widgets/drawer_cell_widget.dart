// Flutter: Existing Libraries

// DrawerCellWidget: StatelessWidget Class
import '../_registry.dart';

class DrawerCellWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final IconData icon;
  final String title;
  final String routeName;

  // Constructor
  const DrawerCellWidget({
    required this.icon,
    required this.title,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    String currentRouteName = ModalRoute.of(context)!.settings.name!;

    // Returning Widgets
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      color: (currentRouteName == routeName) ? Colors.grey : Colors.grey[50],
      child: ListTile(
        onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
        leading: Icon(
          icon,
          size: 30.0,
          color:
              (currentRouteName == routeName) ? Colors.white : Colors.black54,
        ),
        title: Text(
          title,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 15.0,
            color: (currentRouteName == routeName)
                ? Colors.white
                : Colors.black54,
          ),
        ),
      ),
    );
  }
}
