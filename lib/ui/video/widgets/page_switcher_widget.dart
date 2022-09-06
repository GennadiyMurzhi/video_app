import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///widget for switch page on web
class PageSwitcherWidget extends StatefulWidget {
  const PageSwitcherWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  _PageSwitcherWidgetState createState() => _PageSwitcherWidgetState();
}

class _PageSwitcherWidgetState extends State<PageSwitcherWidget> {
  bool _infoButton = true;
  bool _commentButton = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: <Widget>[
          SwitcherButton(
            label: 'Info',
            changed: _infoButton,
            onTap: () {
              setState(() {
                _infoButton = true;
                _commentButton = false;
              });
              widget.pageController.jumpToPage(0);
            },
          ),
          SwitcherButton(
            label: 'Comments',
            changed: _commentButton,
            onTap: () {
              setState(() {
                _infoButton = false;
                _commentButton = true;
              });
              widget.pageController.jumpToPage(1);
            },
          ),
        ],
      ),
    );
  }
}

///button for PageSwitcher
class SwitcherButton extends StatelessWidget {
  const SwitcherButton({
    super.key,
    required this.label,
    required this.changed,
    required this.onTap,
  });

  final String label;
  final bool changed;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: changed ? null : () => onTap() ,
      child: Container(
        color: changed ? Color(0xFFBDBDBD) : Color(0x00000000),
        width: MediaQuery.of(context).size.width / 2,
        alignment: Alignment.center,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
