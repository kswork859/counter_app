import 'package:counter_app/bloc/switch/switch_bloc.dart';
import 'package:counter_app/bloc/switch/switch_events.dart';
import 'package:counter_app/bloc/switch/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Switch Screen Example"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notification",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  builder: (context, states) {
                    return Switch(
                      value: states.isSwitch,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(
                          EnableDisableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, states) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.orange.withValues(alpha: states.slider),
                  ),
                );
              },
            ),

            SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, states) {
                return Slider(
                  value: states.slider,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(
                      SlidersEvents(sliders: value),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
