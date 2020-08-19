import 'package:codeclanmobile/blocs/track_bloc.dart';
import 'package:codeclanmobile/common/snack_bar.dart';
import 'package:codeclanmobile/services/api/models/track_list_dto.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:codeclanmobile/widgets/mentor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorSelectionScreen extends StatefulWidget {
  final Items item;

  const MentorSelectionScreen({Key key, @required this.item}) : super(key: key);
  @override
  _MentorSelectionScreenState createState() => _MentorSelectionScreenState();
}

class _MentorSelectionScreenState extends State<MentorSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) =>
            TracksBloc()..add(FetchTrackMentors(trackId: widget.item.id)),
        child: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(
              height: heightOfScreen,
              width: widthOfScreen,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      stops: [
                    0,
                    0.7,
                    1.0
                  ],
                      colors: [
                    AppColors.backgroundShade1,
                    AppColors.backgroundShade2,
                    AppColors.backgroundShade3,
                  ])),
            ),
            Image.asset('assets/images/eclipse.png'),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
              height: heightOfScreen,
              width: widthOfScreen,
              child: SingleChildScrollView(
                key: PageStorageKey('tracklist-key'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        FlutterIcons.arrow_left_sli,
                        color: Colors.white,
                      ),
                    ),
                    SpaceH12(),
                    Text(
                      'Choose a Mentor',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18)),
                    ),
                    Text(
                      'Let\'s hold you by the hand',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 12)),
                    ),
                    SpaceH20(),
                    BlocConsumer<TracksBloc, TracksState>(
                      listener: (context, state) {
                        if (state is FetchTrackMentorsError) {
                          CodeClanSnackBar.showErrorSnackBar(context,
                              message:
                                  'Sorry, we could not fetch mentors at this time. Please Try again');
                        }
                      },
                      builder: (context, state) {
                        if (state is FetchTrackMentorsLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is FetchTrackMentorsLoaded) {
                          return Container(
                            height: heightOfScreen,
                            width: widthOfScreen,
                            child: ListView.separated(
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.only(top: 0),
                              itemBuilder: (BuildContext context, int index) {
                                return MentorItem();
                              },
                              itemCount: state.tracksMentorsDto.totalCount,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SpaceH16();
                              },
                            ),
                          );
                        }
                        return Container(
                          height: heightOfScreen,
                          width: widthOfScreen,
                          child: ListView.separated(
                            physics: ClampingScrollPhysics(),
                            padding: EdgeInsets.only(top: 0),
                            itemBuilder: (BuildContext context, int index) {
                              return MentorItem();
                            },
                            itemCount: 12,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SpaceH16();
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
