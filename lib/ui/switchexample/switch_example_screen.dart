import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/switch_example/switch_event.dart';
import 'package:flutter_block_demo_practice/bloc/switch_example/switch_state.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Two"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Notification"),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                builder: (context, state) => Switch(
                  value: state.isSwitch,
                  onChanged: (value) {
                    context
                        .read<SwitchBloc>()
                        .add(EnableOrDisableNotification());
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          BlocBuilder<SwitchBloc , SwitchState>(builder: (context, state) {
            return  Container(
              height: 200,
              color: Colors.red.withOpacity(state.slider),
            );
          },),

          SizedBox(
            height: 50,
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,
            builder: (context, state) {
              return Slider(
                value: state.slider,
                onChanged: (value) {
                  print(value);
                  context.read<SwitchBloc>().add(SwitchSlider(slider: value));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
