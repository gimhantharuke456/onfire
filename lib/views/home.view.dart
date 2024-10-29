import 'package:flutter/material.dart';
import 'package:onfire/utils/index.dart';
import 'package:onfire/views/about.view.dart';
import 'package:onfire/views/fire.reasons.view.dart';
import 'package:onfire/views/fire.seviority.view.dart';
import 'package:onfire/views/pressure.cotroll.view.dart';
import 'package:onfire/views/profile.view.dart';
import 'package:onfire/widgets/custom.button.dart';
import 'package:onfire/widgets/custom.input.field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: Text("Profile"),
              //   onTap: () {
              //     context.navigator(context, const ProfileView());
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.add_box_outlined),
                onTap: () {
                  context.navigator(context, const AboutView());
                },
                title: Text("About"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'OnFire',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            labelColor: Color(0xFFFF5722), // Orange color
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFFFF5722),
            tabs: [
              Tab(
                icon: Icon(Icons.local_fire_department),
                text: 'Fire Types',
              ),
              Tab(
                icon: Icon(Icons.assessment),
                text: 'Severity',
              ),
              Tab(
                icon: Icon(Icons.speed),
                text: 'Pressure',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FireReasonsView(),
            FireSeviorityView(),
            PressureControlView(),
          ],
        ),
      ),
    );
  }
}
