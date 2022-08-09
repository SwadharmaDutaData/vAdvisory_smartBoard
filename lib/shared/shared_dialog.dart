part of 'shared.dart';

class SharedDialog {
  static SnackbarController successSnackBar(String title, String message) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: successColor,
      icon: Icon(
        Icons.check_circle_outline,
        color: Colors.white,
      ),
      titleText: Text(
        title,
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }

  static SnackbarController errorSnackBar(String title, String message) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: errorColor,
      icon: Icon(
        Icons.close_outlined,
        color: Colors.white,
      ),
      titleText: Text(
        title,
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText: Text(
        message,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    );
  }
}
