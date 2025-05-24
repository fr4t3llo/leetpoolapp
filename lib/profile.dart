// // ignore_for_file: depend_on_referenced_packages

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF121212),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream:
//             _firestore
//                 .collection('users')
//                 .doc(_auth.currentUser?.uid)
//                 .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(color: Color(0xFF00FF7F)),
//             );
//           }

//           var userData = snapshot.data!.data() as Map<String, dynamic>;

//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Header with Avatar
//                 Container(
//                   padding: EdgeInsets.only(top: 50, bottom: 20),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFF00FF7F), Colors.transparent],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 50,
//                         backgroundImage: NetworkImage(
//                           userData['photoURL'] ?? '',
//                         ),
//                         child:
//                             userData['photoURL'] == null
//                                 ? Icon(
//                                   Icons.person,
//                                   size: 50,
//                                   color: Colors.white,
//                                 )
//                                 : null,
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         userData['username'] ?? '1337 Player',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         '${userData['wins'] ?? 0} Wins | ${userData['losses'] ?? 0} Losses',
//                         style: TextStyle(color: Color(0xFF00FF7F)),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Stats Cards
//                 Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       _StatCard(
//                         title: "Rank",
//                         value: "#${userData['rank'] ?? '--'}",
//                         icon: Icons.leaderboard,
//                       ),
//                       _StatCard(
//                         title: "Win Rate",
//                         value: "${(userData['wins'] ?? 0) * 10}%",
//                         icon: Icons.show_chart,
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Match History
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Recent Matches',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       _MatchHistoryTile(
//                         opponent: "xlogin",
//                         result: "Won",
//                         score: "7-5",
//                       ),
//                       _MatchHistoryTile(
//                         opponent: "hacker42",
//                         result: "Lost",
//                         score: "3-7",
//                       ),
//                     ],
//                   ),
//                 ),

//                 // 1337 Easter Egg Button
//                 TextButton(
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('42: The answer to pool dominance!'),
//                       ),
//                     );
//                   },
//                   child: Text(
//                     'Show 1337 Spirit',
//                     style: TextStyle(color: Color(0xFF00FF7F)),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // Reusable Stat Card Widget
// class _StatCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;

//   const _StatCard({
//     required this.title,
//     required this.value,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color(0xFF1E1E1E),
//       child: Padding(
//         padding: EdgeInsets.all(12),
//         child: Column(
//           children: [
//             Icon(icon, color: Color(0xFF00FF7F)),
//             SizedBox(height: 5),
//             Text(value, style: TextStyle(color: Colors.white, fontSize: 18)),
//             Text(title, style: TextStyle(color: Colors.grey)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Match History Item
// class _MatchHistoryTile extends StatelessWidget {
//   final String opponent;
//   final String result;
//   final String score;

//   const _MatchHistoryTile({
//     required this.opponent,
//     required this.result,
//     required this.score,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: CircleAvatar(child: Text(opponent[0])),
//       title: Text(opponent, style: TextStyle(color: Colors.white)),
//       subtitle: Text(score, style: TextStyle(color: Colors.grey)),
//       trailing: Chip(
//         label: Text(result),
//         backgroundColor: result == "Won" ? Colors.green[800] : Colors.red[800],
//       ),
//     );
//   }
// }
