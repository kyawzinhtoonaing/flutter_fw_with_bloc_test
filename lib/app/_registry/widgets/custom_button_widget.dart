// Flutter: Existing Libraries

// CustomButtonWidget: StatelessWidget Class
import '../_registry.dart';

class CustomButtonWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String buttonTitle;
  final Color color;
  final Function()? callback;
  final double width;
  final double height;

  // Constructor
  const CustomButtonWidget({
    required this.buttonTitle,
    required this.color,
    required this.callback,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return InkWell(
      onTap: callback,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
