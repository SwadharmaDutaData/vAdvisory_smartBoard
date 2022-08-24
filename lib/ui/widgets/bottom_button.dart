part of 'widgets.dart';

class BottomButton extends StatefulWidget {
  final String text;
  final bool? loading;
  final GestureTapCallback? onClick;
  final Color? color;
  const BottomButton({Key? key, required this.text, this.loading = false, this.onClick, this.color}) : super(key: key);

  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = widget.loading!;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h.toDouble(), horizontal: Sizes.dimen_12.h.toDouble()),
      child: SizedBox(
        width: double.infinity,
        height: Sizes.dimen_48,
        child: ElevatedButton(
          onPressed: widget.onClick,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return widget.color ?? secondaryColor;
            }),
          ),
          child: isLoading? loadingIndicator : Text(
            widget.text,
            style: primaryTextFont.copyWith(color: Colors.white, fontSize: Sizes.dimen_20.sp.toDouble()),
          ),
        ),
      ),
    );
  }
}
