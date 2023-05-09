import 'package:flutter/material.dart';

class DayPickerCustom extends StatefulWidget {

  final DateTime? initdate;

  final Widget child;

  final Function(DateTime) onChange;

  const DayPickerCustom({
    super.key,
    this.initdate,
    required this.child,
    required this.onChange,
  });

  @override
  State<DayPickerCustom> createState() => _DayPickerCustomState();
}

class _DayPickerCustomState extends State<DayPickerCustom>
    with TickerProviderStateMixin {
  
  final List<String> listWeekday = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  
  final LayerLink _layerLink = LayerLink();
  bool _isOpen = false;
  late OverlayEntry _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late DateTime selectedDate;
  late DateTime firstDayOfWeek;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    selectedDate = widget.initdate ?? DateTime.now();
    firstDayOfWeek = selectedDate.weekday != 7 ? selectedDate.subtract(Duration(days: selectedDate.weekday)) : selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(onTap: _toggleCalendar, child: widget.child),
    );
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    var size = renderBox.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 15;
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleCalendar(close: true),
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: MediaQuery.of(context).size.height * 0.05, //offset.dx,
                top: topOffset,
                //width: //widget.dropdownStyle.width ?? size.width,
                child: CompositedTransformFollower(
                  offset:
                      //widget.dropdownStyle.offset ??
                      Offset(
                          -(MediaQuery.of(context).size.width *
                              (offset.dx / MediaQuery.of(context).size.width -
                                  0.05)),
                          size.height + 15),
                  link: _layerLink,
                  showWhenUnlinked: false,
                  child: GestureDetector(
                    onTap: () => _toggleCalendar(),
                    child: Material(
                      elevation: //widget.dropdownStyle.elevation ??
                          2,
                      //widget.dropdownStyle.color,
                      //shape: widget.dropdownStyle.shape,
                      child: SizeTransition(
                        axisAlignment: 1,
                        sizeFactor: _expandAnimation,
                        child: ConstrainedBox(
                          constraints: //widget.dropdownStyle.constraints ??
                              BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.2,
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.9),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            firstDayOfWeek = firstDayOfWeek.subtract(const Duration(days: 7));
                                            print(firstDayOfWeek);
                                          });
                                          _toggleCalendar();
                                        },
                                        child: const Icon(Icons.keyboard_arrow_left)),
                                      Text("Tháng ${firstDayOfWeek.add(const Duration(days: 1)).month}, ${firstDayOfWeek.add(const Duration(days: 1)).year}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            firstDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));
                                            print(firstDayOfWeek);
                                          });
                                          _toggleCalendar();
                                        },
                                        child: const Icon(Icons.keyboard_arrow_right)),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List<Widget>.generate(
                                      7,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            selectedDate = firstDayOfWeek.add(Duration(days: index));
                                            _toggleCalendar();
                                            widget.onChange(selectedDate);
                                          },
                                          child: Container(
                                              margin: firstDayOfWeek.add(Duration(days: index)) == selectedDate
                                                  ? const EdgeInsets.symmetric(
                                                      horizontal: 8)
                                                  : EdgeInsets.zero,
                                              padding: firstDayOfWeek.add(Duration(days: index)) == selectedDate
                                                  ? const EdgeInsets.symmetric(
                                                      horizontal: 16, vertical: 8)
                                                  : const EdgeInsets.all(10),
                                              decoration: firstDayOfWeek.add(Duration(days: index)) == selectedDate
                                                  ? BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(12),
                                                      //color: Colors.yellow,
                                                    )
                                                  : const BoxDecoration(
                                                    //color: Colors.red,
                                                  ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "${firstDayOfWeek.add(Duration(days: index)).day}",
                                                    style: firstDayOfWeek.add(Duration(days: index)) == selectedDate
                                                        ? const TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 22,
                                                          )
                                                        : const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                  ),
                                                  Text(
                                                    listWeekday[firstDayOfWeek.add(Duration(days: index)).weekday-1].substring(0,2),
                                                    style: firstDayOfWeek.add(Duration(days: index)) == selectedDate
                                                        ? const TextStyle(
                                                            color: Colors.blue,
                                                          )
                                                        : const TextStyle(),
                                                  ),
                                                ],
                                              )),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleCalendar({bool close = false}) async {
    if (close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
        firstDayOfWeek = selectedDate.weekday != 7 ? selectedDate.subtract(Duration(days: selectedDate.weekday)) : selectedDate;
      });
      print("close");
    } else if (_isOpen == false) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
      print("open");
    } else {
      _overlayEntry.remove();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
      print("keep");
    }
  }
}
