part of 'RoomWidgetsImports.dart';

// class ChatAppBar extends StatelessWidget {
//   final String title, image, job, date, orderNum, reminderTime;
//   final int orderID;
//
//   const ChatAppBar({
//     Key? key,
//     required this.title,
//     required this.image,
//     required this.orderID,
//     required this.job,
//     required this.date,
//     required this.orderNum,
//     required this.reminderTime,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: MyColors.primary,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
// //------------------------------------> image <-------------------------------------------
//               CircleAvatar(
//                 radius: 40,
//                 backgroundImage: NetworkImage(image),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
// //------------------------------------> title <-------------------------------------------
//                     Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: MyColors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       job,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: MyColors.white,
//                       ),
//                     ),
//                     if (reminderTime == "0")
//                       Text(
//                         date,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: MyColors.white,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
// //----------------------------------- Order Num && TIME Reminder --------------------------------
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "#" + orderNum,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: MyColors.white,
//                 ),
//               ),
//               BlocBuilder<GenericBloc<int>, GenericState<int>>(
//                 bloc: ClinicData().tabBarIndex,
//                 builder: (context, tabIndexState) {
//                   return Visibility(
//                     visible: tabIndexState.messageModel == 2,
//                     child: Text(
//                       tr(context,context, "closed"),
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.red,
//                       ),
//                     ),
//                     replacement: Row(
//                       children: [
//                         Icon(
//                           Icons.timer_outlined,
//                           size: 20,
//                           color: MyColors.white,
//                         ),
//                         const SizedBox(width: 5),
//                         Text(
//                           reminderTime == "0"
//                               ? tr(context,context, "closed")
//                               : reminderTime,
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: MyColors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
