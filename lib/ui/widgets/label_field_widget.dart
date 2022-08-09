part of 'widgets.dart';

class LabelFieldWidget extends StatefulWidget {
  final String? label, hint;
  final bool? isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  const LabelFieldWidget({
    Key? key,
    this.label,
    this.hint,
    this.isPassword,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.textInputType,
    this.textInputAction,
  }) : super(key: key);

  @override
  _LabelFieldWidgetState createState() => _LabelFieldWidgetState();
}

class _LabelFieldWidgetState extends State<LabelFieldWidget> {
  bool _isValid = false;
  // bool isObscured = true;

  final OutlineInputBorder _enabledBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(Sizes.dimen_16),
  );

  final OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
    Sizes.dimen_16,
  ));

  @override
  Widget build(BuildContext context) {
    Widget _suffixIcon = widget.suffixIcon == null
    ?IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          setState(() {
            _isValid = false;
            widget.controller!.clear();
          });
        })
    : widget.suffixIcon!;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.dimen_16,
          ),
        ),
        child: TextField(
          onChanged: (text) {
            setState(() {
              _isValid = text.isNotEmpty;
            });
          },
          style: primaryTextFont.copyWith(fontSize: Sizes.dimen_12),
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType!,
          obscureText: widget.isPassword!,
          obscuringCharacter: '*',
          controller: widget.controller!,
          decoration: InputDecoration(
              enabledBorder: _enabledBorder,
              border: _border,
              labelText: widget.label,
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon,
              suffixIcon: (_isValid) ? _suffixIcon : null),
        ),
      ),
    );
  }
}
