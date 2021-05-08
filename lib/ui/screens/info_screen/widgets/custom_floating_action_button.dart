// import 'package:anilist_app/core/models/info_model.dart';
// import 'package:anilist_app/core/view_models/main_view_model.dart';
// import 'package:anilist_app/ui/values/colors.dart';
// import 'package:anilist_app/ui/values/styles.dart';
// import 'package:anilist_app/ui/values/values.dart';
// import 'package:fab_circular_menu/fab_circular_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class CustomFloatingActionButton extends StatefulWidget {
//   AsyncSnapshot<InfoModel?> snapshot;
//   int id;

//   CustomFloatingActionButton({
//     required this.snapshot,
//     required this.id,
//   });

//   @override
//   _CustomFloatingActionButtonState createState() =>
//       _CustomFloatingActionButtonState();
// }

// class _CustomFloatingActionButtonState
//     extends State<CustomFloatingActionButton> {
//   @override
//   Widget build(BuildContext context) {
//     final mainViewModel = Provider.of<MainViewModel>(context);
//     return FabCircularMenu(
//       fabSize: 50,
//       fabOpenColor: tertiaryColor.withOpacity(.8),
//       fabCloseIcon: Icon(
//         Icons.close,
//         color: lightColor,
//       ),
//       fabOpenIcon: Icon(
//         Icons.add,
//         color: Colors.white,
//       ),
//       ringColor: secondaryColor.withOpacity(.7),
//       children: [
//         IconButton(
//           icon: Icon(
//             FontAwesomeIcons.plus,
//             color: tertiaryColor,
//           ),
//           onPressed: () => showModalBottomSheet(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             backgroundColor: primaryColor,
//             isDismissible: true,
//             context: context,
//             builder: (context) {
//               mainViewModel.setCurrentDropDownButton('CURRENT');
//               return Container(
//                 child: ListView(
//                   padding: EdgeInsets.all(DEFAULT_PADDING_MAXIMUM),
//                   children: [
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         widget.snapshot.data!.media.title.romaji,
//                         style: TegakiTextStyles.callout.copyWith(
//                           fontSize: 22,
//                         ),
//                       ),
//                     ),
//                     DropdownButton(
//                       value: mainViewModel.currentDropdownValue,
//                       items: mainViewModel.buttons,
//                       dropdownColor: secondaryColor,
//                       iconEnabledColor: tertiaryColor,
//                       onChanged: (dynamic value) =>
//                           mainViewModel.setCurrentDropDownButton(value),
//                     ),
//                     Text("aaa"),
//                     Text("aaa"),
//                     Text("aaa"),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//         IconButton(
//           icon: Icon(
//             FontAwesomeIcons.solidBookmark,
//             color: tertiaryColor,
//           ),
//           onPressed: () {
//             mainViewModel.setMediaAsWatching(widget.id).then(
//                   (success) => success
//                       ? ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                                 '${widget.snapshot.data!.media.title.romaji} added to watching list!'),
//                             elevation: 2.0,
//                             backgroundColor: tertiaryColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         )
//                       : ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                                 'Error while adding ${widget.snapshot.data!.media.title.romaji} to the list'),
//                             elevation: 2.0,
//                             backgroundColor: tertiaryColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                 );
//           },
//         ),
//         IconButton(
//           icon: Icon(
//             FontAwesomeIcons.solidHeart,
//             color: tertiaryColor,
//           ),
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }
