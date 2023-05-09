import 'package:flutter/material.dart';
import 'package:ndkhoa_module/src/components/app_dropdown.dart';

class DropdownCustom2<T> extends StatefulWidget {
  /// the child widget for the button, this will be ignored if text is supplied
  final Widget child;

  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(int, int) onChange;

  /// list of DropdownItems
  final List<DropdownItem<T>> items;
  List<DropdownItem<T>> items2;
  final DropdownStyle dropdownStyle;
  //final bool item2ValueChange;

  /// title
  final Text title;
  final Text? title2;

  /// dropdownButtonStyles passes styles to OutlineButton.styleFrom()
  final DropdownButtonStyle dropdownButtonStyle;

  /// dropdown button icon defaults to caret
  final Icon? icon;
  final bool hideIcon;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool leadingIcon;

  /// if true icon animation will play
  final bool enableIconAnimation;

  ///init value
  int initIndex = -1;
  int initIndex2 = -1;

  DropdownCustom2({
    Key? key,
    this.hideIcon = false,
    required this.onChange,
    required this.title,
    required this.items,
    this.title2,
    required this.items2,
    //this.item2ValueChange = false,
    this.dropdownStyle = const DropdownStyle(),
    this.dropdownButtonStyle = const DropdownButtonStyle(),
    this.icon,
    this.leadingIcon = false,
    this.enableIconAnimation = true,
    required this.child,
    this.initIndex = -1,
    this.initIndex2 = -1,
  }) : super(key: key);

  @override
  State<DropdownCustom2> createState() => _DropdownCustomState();
}

class _DropdownCustomState<T> extends State<DropdownCustom2<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  final ScrollController _scrollController2 =
      ScrollController(initialScrollOffset: 0);
  late OverlayEntry _overlayEntry;
  int _currentIndex = -1;
  int _currentIndex2 = -1;
  bool _isOpen = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _currentIndex = widget.initIndex;
    _currentIndex2 = widget.initIndex2;
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.dropdownButtonStyle;
    // link the overlay to the button
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        width: style.width,
        height: style.height,
        padding: style.padding,
        decoration: BoxDecoration(
          color: style.backgroundColor,
        ),
        child: InkWell(
          onTap: _toggleDropdown,
          child: Row(
            mainAxisAlignment:
                style.mainAxisAlignment ?? MainAxisAlignment.center,
            textDirection:
                widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.child,
              if (!widget.hideIcon)
                widget.enableIconAnimation
                    ? RotationTransition(
                        turns: _rotateAnimation,
                        child: widget.icon ??
                            const Padding(
                              padding: EdgeInsets.only(left: 5, right: 7),
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                      )
                    : widget.icon ??
                        const Padding(
                          padding: EdgeInsets.only(left: 5, right: 7),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 13,
                              color: Colors.black,
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    RenderBox renderBox = context.findRenderObject()! as RenderBox;
    var size = renderBox.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    // print(MediaQuery.of(context).size.width);
    // print(offset.dx);
    // print(size.width);
    // print(MediaQuery.of(context).size.width - offset.dx + size.width);
    // print(offset.dy);
    // print(size.height);
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: widget.dropdownStyle.width ?? size.width,
                child: CompositedTransformFollower(
                  offset:
                      widget.dropdownStyle.offset ?? Offset(0, size.height + 5),
                  link: _layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    elevation: widget.dropdownStyle.elevation ?? 0,
                    color: widget.dropdownStyle.color,
                    shape: widget.dropdownStyle.shape,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation,
                      child: RawScrollbar(
                        thumbVisibility: true,
                        thumbColor: widget.dropdownStyle.scrollbarColor ??
                            Colors.grey,
                        controller: _scrollController,
                        child: Padding(
                          padding:
                              widget.dropdownStyle.padding ?? EdgeInsets.zero,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildTitle(widget.title),
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                controller: _scrollController,
                                children:
                                    widget.items.asMap().entries.map((item) {
                                  return InkWell(
                                    onTap: () {
                                      if (_currentIndex == item.key) {
                                        setState(() => _currentIndex = -1);
                                        widget.onChange(-1, _currentIndex2);
                                      } else {
                                        setState(
                                            () => _currentIndex = item.key);
                                        widget.onChange(
                                            item.key, _currentIndex2);
                                      }
                                      _toggleDropdown();
                                    },
                                    child: _currentIndex == item.key
                                        ? ColoredBox(
                                            color: widget.dropdownStyle
                                                    .selectedColor ??
                                                const Color.fromARGB(
                                                    255, 231, 230, 230),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.check),
                                                item.value,
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                left: 24),
                                            child: item.value,
                                          ),
                                  );
                                }).toList(),
                              ),
                              widget.title2 != null
                                  ? _buildTitle(widget.title2!)
                                  : const Divider(
                                      color: Colors.black,
                                    ),
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                controller: _scrollController2,
                                children:
                                    widget.items2.asMap().entries.map((item) {
                                  return InkWell(
                                    onTap: () {
                                      if (_currentIndex2 == item.key) {
                                        setState(() => _currentIndex2 = -1);
                                        widget.onChange(_currentIndex, -1);
                                      } else {
                                        setState(
                                            () => _currentIndex2 = item.key);
                                        widget.onChange(
                                            _currentIndex, item.key);
                                      }
                                      _toggleDropdown();
                                    },
                                    child: _currentIndex2 == item.key
                                        ? ColoredBox(
                                            color: widget.dropdownStyle
                                                    .selectedColor ??
                                                const Color.fromARGB(
                                                    255, 231, 230, 230),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.check),
                                                item.value,
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                left: 24),
                                            child: item.value,
                                          ),
                                  );
                                }).toList(),
                              ),
                            ],
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

  Padding _buildTitle(Text title) {
    return Padding(
      padding: widget.dropdownStyle.padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title,
          const Icon(Icons.arrow_drop_up),
        ],
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else if (_isOpen == false) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    } else {
      _overlayEntry.remove();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
    }
  }
}
