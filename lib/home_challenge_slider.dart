import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/widgets/background_sliver.dart';
import 'package:movie_app/widgets/body_sliver.dart';
import 'package:movie_app/widgets/cover_photo.dart';
import 'package:movie_app/widgets/cut_rectangle.dart';
import 'package:movie_app/widgets/data_cut+rectangle.dart';
import 'package:movie_app/widgets/favorite_circle.dart';

class HomeSliverChallenge extends StatefulWidget {
  const HomeSliverChallenge({Key? key}) : super(key: key);

  @override
  State<HomeSliverChallenge> createState() => _HomeSliverChallengeState();
}

class _HomeSliverChallengeState extends State<HomeSliverChallenge> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: _AppBarNetflix(
                  maxExtended: size.height * 0.35,
                  minExtended: kToolbarHeight,
                  size: size)),
          SliverToBoxAdapter(
            child: Body(),
          )
        ],
      ),
    );
  }
}

class _AppBarNetflix extends SliverPersistentHeaderDelegate {
  _AppBarNetflix(
      {required this.maxExtended,
      required this.minExtended,
      required this.size});

  final double maxExtended;
  final double minExtended;
  final Size size;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    final percent = shrinkOffset / maxExtended;

    ///validate the angle at whoch the card returns
    final uploadlimit = 13 / 100;

    ///return value of the card
    final valueback = (1 - percent - 0.77).clamp(0, uploadlimit);
    final fixrotation = pow(percent, 1.5);
    final card = _CoverCard(
        size: size,
        percent: percent,
        uploadlimit: uploadlimit,
        valueback: valueback);

    final bottomSliverBar = _CustomBottomSliverBar(
        size: size, fixrotation: fixrotation, percent: percent);

    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundSliver(),
          if (percent > uploadlimit) ...[
            card,
            bottomSliverBar,
          ] else ...[
            bottomSliverBar,
            card,
          ],
          FavoriteCircle(size: size, percent: percent)
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExtended;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _CoverCard extends StatelessWidget {
  final Size size;
  final double percent;
  final double angleForCard = 6.5;
  final double uploadlimit;
  final num valueback;

  _CoverCard(
      {Key? key,
      required this.size,
      required this.percent,
      required this.uploadlimit,
      required this.valueback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * 0.15,
        left: size.width / 24,
        child: Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.identity()
            ..rotateZ(percent > uploadlimit
                ? (valueback * angleForCard)
                : percent * angleForCard),
          child: CoverPhoto(size: size),
        ));
  }
}

class _CustomBottomSliverBar extends StatelessWidget {
  final Size size;
  final num fixrotation;
  final double percent;

  _CustomBottomSliverBar(
      {Key? key,
      required this.fixrotation,
      required this.percent,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: -size.width * fixrotation.clamp(0, 0.35),
        right: 0,
        child: _CustomBottomSliver(
          size: size,
          percent: percent,
        ));
  }
}

class _CustomBottomSliver extends StatelessWidget {
  final Size size;
  final double percent;

  const _CustomBottomSliver(
      {Key? key, required this.size, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: CutRectangle(),
          ),
          DataCutRectangle(
            size: size,
            percent: percent,
          )
        ],
      ),
    );
  }
}
