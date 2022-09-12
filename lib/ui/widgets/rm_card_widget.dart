part of 'widgets.dart';

class RmCardWidget extends StatefulWidget {
  final RmModel? item;

  const RmCardWidget({Key? key, this.item}) : super(key: key);

  @override
  _RmCardWidgetState createState() => _RmCardWidgetState();
}

class _RmCardWidgetState extends State<RmCardWidget> {
  double? ratingValue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Uint8List imgByte = base64Decode(widget.item!.imagedata!);
    return Visibility(
      visible: widget.item!.rmstatus != 1 ? false : true,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                Sizes.dimen_8.w.toDouble(), Sizes.dimen_16.h.toDouble(), Sizes.dimen_8.w.toDouble(), Sizes.dimen_16.h.toDouble()),
            child: Material(
              elevation: 3,
              shadowColor: thirdColor,
              borderRadius: BorderRadius.circular(Sizes.dimen_8),
              child: Container(
                  width: size.width * 0.18,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child:
                            widget.item!.imageurl != ''
                        ? Center(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                // image: MemoryImage(imgByte),
                                image: NetworkImage(widget.item!.imageurl!),
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
                        child: Image(
                          height: Sizes.dimen_60.h.toDouble(),
                          image: AssetImage('assets/images/rm_icon.png'),
                        ),
                      ),
                      ),
                      SizedBox(
                        height: Sizes.dimen_8.h.toDouble(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                                widget.item!.rmname!,
                                textAlign: TextAlign.center,
                                style: primaryTextFont.copyWith(
                                    color: widget.item! != 0
                                        ? mainColor
                                        : deepGrey,
                                    fontSize: Sizes.dimen_20.sp.toDouble(),
                                    fontWeight: FontWeight.bold),
                              ),
                            SizedBox(height: Sizes.dimen_2.h.toDouble(),),
                            RatingBar(
                                initialRating: widget.item!.rating!,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: Sizes.dimen_20.sp.toDouble(),
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                    full: Icon(Icons.star, color: Colors.orange),
                                    half: Icon(
                                      Icons.star_half,
                                      color: Colors.orange,
                                    ),
                                    empty: Icon(
                                      Icons.star_outline,
                                      color: Colors.orange,
                                    )),
                                onRatingUpdate: (value) {
                                  setState(() {
                                    ratingValue = value;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(
            right: Sizes.dimen_6.w.toDouble(),
            top: Sizes.dimen_14.h.toDouble(),
            child: Badge(
              alignment: Alignment.center,
              toAnimate: true,
              animationDuration: const Duration(milliseconds: 1500),
              shape: BadgeShape.square,
              badgeColor: mainColor,
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(Sizes.dimen_8)),
              badgeContent: Row(
                children: [
                  Icon(Icons.circle, size: Sizes.dimen_8.sp.toDouble(), color: widget.item!.rmstatus! == 1
                      ? successColor
                      : widget.item!.rmstatus! == 2
                      ? Colors.amber
                      : errorColor,),
                  SizedBox(width: Sizes.dimen_4.w.toDouble(),),
                  AutoSizeText(
                      widget.item!.rmstatus! == 1
                          ? 'Available'
                          : widget.item!.rmstatus! == 2
                              ? 'Busy'
                              : 'Offline',
                      maxLines: 1,
                      style: primaryTextFont.copyWith(color: Colors.white, fontSize: Sizes.dimen_16.sp.toDouble())),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
