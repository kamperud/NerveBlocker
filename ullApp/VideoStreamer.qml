//import QtQuick 2.0
//import QtMultimedia 5.0

///*
//Rectangle {
//    width: 800
//    height: 600
//    color: "black"

//    MediaPlayer {
//        id: player
//        source: "http://techslides.com/demos/sample-videos/small.webm"
//        autoPlay: true
//    }

//    VideoOutput {
//        id: videoOutput
//        source: player
//        anchors.fill: parent
//    }
//}
//*/

//Item {
//    MediaPlayer {
//        id: mediaplayer
//        source: "http://techslides.com/demos/sample-videos/small.webm"
//    }

//    VideoOutput {
//        anchors.fill: parent
//        source: mediaplayer
//    }

//    MouseArea {
//        id: playArea
//        anchors.fill: parent
//        onPressed: mediaplayer.play();
//    }
//}
///*
//Item {
//    id: videoPlayer
//    Rectangle {
//        anchors.fill: parent

//        Rectangle {
//            id: videoContainer
//            width:  parent.width / 2
//            height: parent.height / 2
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.verticalCenter: parent.verticalCenter
//            MouseArea {
//                id: playerArea
//                anchors.top: parent.top; anchors.left: parent.left;
//                width: parent.width; height: parent.height - controlBar.height
//                onPressed: {
//                    if(player.playbackState == MediaPlayer.PlayingState) {
//                        player.pause();
//                    } else {
//                        player.play();
//                    }
//                }
//            }
//            MediaPlayer {
//                id: player
//                autoPlay: false
//                source: "http://techslides.com/demos/sample-videos/small.webm"
//                property string prefix: "qrc:/"
//                property string play_icon: prefix+"ios/images/play.png"
//                property string pause_icon: prefix+"ios/images/play.png"
//                onStopped: {
//                    playButton.source = play_icon
//                }
//                onPaused: {
//                    playButton.source = play_icon
//                }
//                onPlaying: {
//                    playButton.source = pause_icon
//                }
//            }
//            VideoOutput {
//                id: videoOutput
//                source: player
//                anchors.fill:parent
//            }
//            Item {
//                id: overlayIconContainer
//                anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter
//                width: 50; height: 50
//                Image {
//                    id: overlayIcon
//                    source: player.play_icon
//                    opacity: 50
//                }
//            }
//            Rectangle {
//                id: controlBar
//                color: "lightgray"
//                anchors.left: parent.left; anchors.bottom: parent.bottom;
//                height: 50; width: parent.width
//                Rectangle {
//                    id: playButtonContainer
//                    anchors.left: controlBar.left; anchors.bottom: controlBar.bottom
//                    width: 50; height: 50
//                    color: "transparent"
//                    Item {
//                        Image {
//                            id: playButton
//                            source: player.play_icon
//                        }
//                    }
//                }
//                MouseArea {
//                    id: playArea
//                    anchors.fill: playButtonContainer
//                    onPressed: {
//                        if(player.playbackState == MediaPlayer.PlayingState) {
//                            player.pause();
//                        } else {
//                            player.play();
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//*/
