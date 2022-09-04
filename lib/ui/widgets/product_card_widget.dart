part of 'widgets.dart';

class ProductCardWidget extends StatefulWidget {
  final ProductModel item;
  final GestureTapCallback? onClick;


  const ProductCardWidget({Key? key, required this.item, this.onClick}) : super(key: key);

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // Uint8List imgByte = base64Decode(widget.item.icon!);
    return GestureDetector(
      onTap: widget.onClick,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            Sizes.dimen_8.w.toDouble(), Sizes.dimen_16.h.toDouble(), Sizes.dimen_8.w.toDouble(), Sizes.dimen_16),
        child: Material(
          elevation: 3,
          shadowColor: thirdColor,
          borderRadius: BorderRadius.circular(8),
          child: Container(
              width: size.width * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Sizes.dimen_8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    widget.item.iconurl != ''
                        ? Center(
                      child: Image.network(widget.item.iconurl!, height: size.height.h.toDouble() * 0.2,)
                      )
                     : Center(child: Image.asset('assets/images/produk_bni.png', height: size.height.h.toDouble() * 0.2,),),
                  SizedBox(
                    height: Sizes.dimen_10.h.toDouble(),
                  ),
                  Text(
                      widget.item.productname!.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: primaryTextFont.copyWith(
                          color: widget.item != 0
                              ? secondaryColor
                              : deepGrey,
                          fontSize: Sizes.dimen_24.sp.toDouble(),
                          fontWeight: FontWeight.bold),
                    ),
                ],
              )),
        ),
      ),
    );
  }
}
