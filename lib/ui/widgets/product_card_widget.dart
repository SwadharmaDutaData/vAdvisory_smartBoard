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
    Uint8List imgByte = base64Decode(widget.item.icon!);
    return GestureDetector(
      onTap: widget.onClick,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            Sizes.dimen_8, Sizes.dimen_16, Sizes.dimen_8, Sizes.dimen_16),
        child: Material(
          elevation: 3,
          shadowColor: thirdColor,
          borderRadius: BorderRadius.circular(8),
          child: Container(
              width: size.width * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child:
                    widget.item.icon != ''
                        ? Center(
                      child: Image.memory(imgByte, height: size.height * 0.2,)
                      )
                      // Container(
                      //   decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //           image: MemoryImage(imgByte),
                      //         scale: 0.1
                      //       ),
                      //   ),
                      // ),
                     : Center(child: Image.asset('assets/images/produk_bni.png', height: size.height * 0.2,),)
                  ),
                  const SizedBox(
                    height: Sizes.dimen_10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.item.productname!.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: primaryTextFont.copyWith(
                          color: widget.item != 0
                              ? thirdColor
                              : deepGrey,
                          fontSize: Sizes.dimen_24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ),
      ),


      // Material(
      //   elevation: 3,
      //   shadowColor: Colors.black,
      //   borderRadius: BorderRadius.circular(8),
      //   child: Container(
      //       padding: const EdgeInsets.all(Sizes.dimen_4),
      //       width: double.infinity,
      //       height: 120,
      //       decoration: BoxDecoration(
      //           color: Colors.white, borderRadius: BorderRadius.circular(8)),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           ///icon
      //           Expanded(
      //             flex: 4,
      //             child: widget.item.icon != ''
      //               ? Image.memory(
      //             imgByte,
      //             height: size.height * 0.1,
      //           )
      //               : Image.asset(
      //             'assets/images/produk_bni.png',
      //             height: size.height * 0.1,
      //           ),),
      //           const SizedBox(
      //             height: Sizes.dimen_16,
      //           ),
      //           ///name
      //           Expanded(
      //             flex: 1,
      //             child: AutoSizeText(
      //               widget.item.productname!.toUpperCase(),
      //               maxLines: 2,
      //               presetFontSizes: [Sizes.dimen_12, Sizes.dimen_10, Sizes.dimen_8],
      //               textAlign: TextAlign.center,
      //               style: primaryTextFont.copyWith(
      //                   color: darkGrey,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ],
      //       )),
      // ),
    );
  }
}
