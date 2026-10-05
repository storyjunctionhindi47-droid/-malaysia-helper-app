import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main()=>runApp(MaterialApp(home:HomePage(),debugShowCheckedModeBanner:false));
class HomePage extends StatefulWidget{ @override _HomePageState createState()=>_HomePageState();}
class _HomePageState extends State<HomePage>{
String rate="Loading...";
@override void initState(){super.initState();getRate();}
getRate() async { try{var r=await http.get(Uri.parse('https://open.er-api.com/v6/latest/MYR'));var d=json.decode(r.body);setState(()=>rate="${d['rates']['NPR']}");}catch(e){setState(()=>rate="34.20");}}
open(String u) async {var uri=Uri.parse(u); if(await canLaunchUrl(uri)) await launchUrl(uri,mode:LaunchMode.externalApplication);}
call(String n) async {var uri=Uri.parse('tel:$n'); if(await canLaunchUrl(uri)) await launchUrl(uri);}
wa(String n) async {var uri=Uri.parse('https://wa.me/${n.replaceAll('+','')}'); if(await canLaunchUrl(uri)) await launchUrl(uri,mode:LaunchMode.externalApplication);}
@override Widget build(BuildContext context){
return Scaffold(appBar: AppBar(title:Text('Malaysia Helper - Ramesh'),backgroundColor:Colors.blue[800]),
body:ListView(padding:EdgeInsets.all(12),children:[
Card(color:Colors.orange[50],child:ListTile(title:Text('📦 Courier - Ramesh Yadav',style:TextStyle(fontWeight:FontWeight.bold)),subtitle:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('ry666372@gmail.com'),Text('+60 1111817544'),Text('+97 79823008293')]),)),
Wrap(spacing:6,children:[ElevatedButton(onPressed:()=>open('mailto:ry666372@gmail.com'),child:Text('Email')),ElevatedButton(onPressed:()=>wa('+601111817544'),child:Text('WA MY'),style:ElevatedButton.styleFrom(backgroundColor:Colors.green)),ElevatedButton(onPressed:()=>wa('+9779823008293'),child:Text('WA NP'))]),
Card(color:Colors.green[50],child:ListTile(title:Text('Exchange: 1 MYR = $rate NPR'),leading:Icon(Icons.currency_exchange))),
Card(color:Colors.red[50],child:Padding(padding:EdgeInsets.all(10),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('🏛️ Nepal Embassy KL',style:TextStyle(fontWeight:FontWeight.bold)),Text('Wisma Paradise, 63 Jalan Ampang'),Text('+60 3-2020 1898'),Wrap(children:[ElevatedButton(onPressed:()=>call('+60320201898'),child:Text('Call')),SizedBox(width:6),ElevatedButton(onPressed:()=>open('https://www.google.com/maps/search/Nepal+Embassy+Kuala+Lumpur'),child:Text('Map')),SizedBox(width:6),ElevatedButton(onPressed:()=>open('https://my.nepalembassy.gov.my/'),child:Text('Website'))])]))),
SizedBox(height:10),
GridView.count(shrinkWrap:true,physics:NeverScrollableScrollPhysics(),crossAxisCount:2,childAspectRatio:3,crossAxisSpacing:6,mainAxisSpacing:6,children:[
ElevatedButton(onPressed:()=>open('https://www.google.com/travel/flights'),child:Text('Flight Check',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://www.myeg.com.my/'),child:Text('Visa Check',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://www.fomema2u.com.my/'),child:Text('Medical Report',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://www.fwcms.com.my/'),child:Text('ID Status',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://www.busonlineticket.com/booking/penang-to-klia'),child:Text('Bus Penang-KLIA',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://my.nepalembassy.gov.my/passport-renewal/'),child:Text('Passport Renew',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://translate.google.com/'),child:Text('Translate 10+ Lang',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://www.google.com/maps/search/Nepali+restaurant+Malaysia'),child:Text('Nepali Restaurant',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://www.google.com/maps/search/IME+money+transfer+near+me'),child:Text('IME Location',style:TextStyle(fontSize:11))),
ElevatedButton(onPressed:()=>open('https://www.google.com/maps/search/RIA+money+transfer+near+me'),child:Text('RIA Location',style:TextStyle(fontSize:11))),
]),
])));}}
