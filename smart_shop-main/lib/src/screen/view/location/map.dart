import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_shop/src/screen/view/location/controller/location_controller.dart';
import 'package:smart_shop/src/screen/widgets/k_text.dart';


// class MapScreen extends StatelessWidget {
//
//   final Completer<GoogleMapController> _controller =
//   Completer<GoogleMapController>();
//
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:KText(text: "Your Current Location",fontSize: 14,)),
//       body:  Stack(
//         children: <Widget>[
//           GoogleMap(
//               initialCameraPosition: CameraPosition(
//                   target:
//              LatLng(
//                23.810331,
//                90.412521,
//              ),
//               zoom: 12)
//           )
//         ],
//       )
//
//     );
//   }
// }

 class MapScreen extends StatefulWidget {
   const MapScreen({Key? key}) : super(key: key);

   @override
   State<MapScreen> createState() => _MapScreenState();
 }

 class _MapScreenState extends State<MapScreen> {
// created controller to display Google Maps
   Completer<GoogleMapController> _controller = Completer();
   //on below line we have set the camera position
   static final CameraPosition _kGoogle = const CameraPosition(
     target: LatLng(19.0759837, 72.8776559),
     zoom: 12,
   );

   final Set<Marker> _markers = {};
   final Set<Polyline> _polyline = {};

   // list of locations to display polylines
   List<LatLng> latLen = [
     LatLng(19.0759837, 72.8776559),
     LatLng(28.679079, 77.069710),
    // LatLng(26.850000, 80.949997),
     // LatLng(24.879999, 74.629997),
     // LatLng(16.166700, 74.833298),
   //  LatLng(12.971599, 77.594563),
   ];

   @override
   void initState() {
     // TODO: implement initState
     super.initState();

     // declared for loop for various locations
     for(int i=0; i<latLen.length; i++){
       _markers.add(
         // added markers
           Marker(
             markerId: MarkerId(i.toString()),
             position: latLen[i],
             infoWindow: InfoWindow(
               title: 'HOTEL',
               snippet: '${latLen[i]}',
             ),
             icon: BitmapDescriptor.defaultMarker,
           )
       );
       setState(() {

       });
       _polyline.add(
           Polyline(
             polylineId: PolylineId('1'),
             points: latLen,
             color: Colors.green,
           )
       );
     }
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Color(0xFF0F9D58),
         // title of app
         title: Text("GFG"),
       ),
       body: Container(
         child: SafeArea(
           child: GoogleMap(
             //given camera position
             initialCameraPosition: _kGoogle,
             // on below line we have given map type
             mapType: MapType.normal,
             // specified set of markers below
             markers: _markers,
             // on below line we have enabled location
             myLocationEnabled: true,
             myLocationButtonEnabled: true,
             // on below line we have enabled compass location
             compassEnabled: true,
             // on below line we have added polylines
             polylines: _polyline,
             // displayed google map
             onMapCreated: (GoogleMapController controller){
               _controller.complete(controller);
             },
           ),
         ),
       ),
     );
   }
 }

