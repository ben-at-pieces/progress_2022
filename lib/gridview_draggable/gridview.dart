import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';

import 'grid_item.dart';
import 'images.dart';

class GridWithScrollControllerExample extends StatefulWidget {
  GridWithScrollControllerExample({Key? key,}) : super(key: key);


  @override
  GridWithScrollControllerExampleState createState() => GridWithScrollControllerExampleState();
}

class GridWithScrollControllerExampleState extends State<GridWithScrollControllerExample>{
  final List<DraggableGridItem> _listOfDraggableGridItem = [];
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  @override
  void initState() {
    _generateImageData();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black26,
        child: DraggableGridViewBuilder(
          padding: EdgeInsets.all(2),
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1),
          ),
          children: _listOfDraggableGridItem,
          // children: _listOfDraggableGridItem,
          dragCompletion: onDragAccept,
          isOnlyLongPress: false,
          dragFeedback: feedback,
          dragPlaceHolder: placeHolder,
        ),
      ),
    );
  }

  Widget feedback(List<DraggableGridItem> list, int index) {
    return Container(
      child: list[index].child,
      width: 200,
      height: 350,
    );
  }

  PlaceHolderWidget placeHolder(List<DraggableGridItem> list, int index) {
    return PlaceHolderWidget(
      child: Container(
        color: Colors.white,
      ),
    );
  }

  void onDragAccept(List<DraggableGridItem> list, int beforeIndex, int afterIndex) {
    log('onDragAccept: $beforeIndex -> $afterIndex');
  }

  void _generateImageData() {
    _listOfDraggableGridItem.addAll(
      [
        DraggableGridItem(
          child: GridItem(image: Images.asset_1),
          isDraggable: true,
          dragCallback: (context, isDragging) {
            log('isDragging: $isDragging');
          },
        ),
        // DraggableGridItem(child: GridItem(image: Images.asset_1), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_2), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_3), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_4), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_5), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_6), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_7), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_8), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_9), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_10), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_11), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_12), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_13), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_14), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_15), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_16), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_17), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_18), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_19), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_20), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_21), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_22), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_23), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_24), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_25), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_26), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_27), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_28), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_29), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_30), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_31), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_32), isDraggable: true),
        DraggableGridItem(child: GridItem(image: Images.asset_33), isDraggable: true),
      ],
    );
  }
}