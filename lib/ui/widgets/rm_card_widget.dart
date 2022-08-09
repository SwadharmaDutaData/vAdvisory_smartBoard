part of 'widgets.dart';

class RmCardWidget extends StatefulWidget {
  final RmModel? item;

  const RmCardWidget({Key? key, this.item}) : super(key: key);

  @override
  _RmCardWidgetState createState() => _RmCardWidgetState();
}

class _RmCardWidgetState extends State<RmCardWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Uint8List imgByte = base64Decode(widget.item!.imagedata!);
    return Stack(
      children: [
        Padding(
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
                          widget.item!.imagedata != ''
                      ? Center(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(imgByte),
                              fit: BoxFit.cover
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(Sizes.dimen_8),
                              topLeft: Radius.circular(Sizes.dimen_8),
                            )
                          ),
                        ),
                      ) : ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        widget.item!.rmstatus == 0 ? deepGrey : mainColor,
                        BlendMode.srcATop,
                      ),
                      child: const Image(
                        height: Sizes.dimen_60,
                        image: AssetImage('assets/images/rm_icon.png'),
                      ),
                    ),
                    ),
                    const SizedBox(
                      height: Sizes.dimen_10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          widget.item!.rmname!,
                          textAlign: TextAlign.center,
                          style: primaryTextFont.copyWith(
                              color: widget.item! != 0
                                  ? thirdColor
                                  : deepGrey,
                              fontSize: Sizes.dimen_24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
          right: Sizes.dimen_6,
          top: Sizes.dimen_14,
          child: Badge(
            alignment: Alignment.center,
            toAnimate: true,
            animationDuration: const Duration(milliseconds: 1500),
            shape: BadgeShape.square,
            badgeColor: mainColor,
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(8)),
            badgeContent: Row(
              children: [
                Icon(Icons.circle, size: Sizes.dimen_8, color: widget.item!.rmstatus! == 1
                    ? successColor
                    : widget.item!.rmstatus! == 2
                    ? Colors.amber
                    : errorColor,),
                const SizedBox(width: Sizes.dimen_4,),
                AutoSizeText(
                    widget.item!.rmstatus! == 1
                        ? 'Available'
                        : widget.item!.rmstatus! == 2
                            ? 'Busy'
                            : 'Offline',
                    maxLines: 1,
                    style: primaryTextFont.copyWith(color: Colors.white, fontSize: Sizes.dimen_16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
