import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia

ApplicationWindow {
    visible: true
    width: 500
    height: 460
    title: "Metronome"

    property int beatCount: 4
    property int bpm: 120
    property var beats: []
    property int currentBeatIndex: 0  // 当前节拍索引
    property bool isPlaying: false

    Timer {
        id: metronomeTimer
        interval: 60000 / bpm
        repeat: true
        running: isPlaying
        onTriggered: {
            if (beats[currentBeatIndex].level != 0) {
                playSound(beats[currentBeatIndex].level);
            }
            currentBeatIndex = (currentBeatIndex + 1) % beats.length;  // 递增索引
        }
    }

    function initBeats() {
        beats = []
        for (var i = 0; i < beatCount; ++i) {
            beats.push({level: 1})
        }
        currentBeatIndex = 0;  // 重置索引
    }
    Component.onCompleted: initBeats()

    SoundEffect {
        id: weakBeat
        source: "wav/弱.wav"
    }

    SoundEffect {
        id: mediumBeat
        source: "wav/次强.wav"
    }

    SoundEffect {
        id: strongBeat
        source: "wav/强.wav"
    }

    function playSound(level) {
        switch (level) {
        case 1:
            weakBeat.play();
            break;
        case 2:
            mediumBeat.play();
            break;
        case 3:
            strongBeat.play();
            break;
        }
    }

    Rectangle {
        id: gradientBackground
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1e90ff" }  // 渐变开始颜色
            GradientStop { position: 1.0; color: "#ff7f50" }  // 渐变结束颜色
        }
    }

    Column {
        anchors.fill: parent
        spacing: 15

        Rectangle {
            width: 30
            height: 5  // 设置空隙的高度
            color: "transparent"  // 设置透明颜色，不显示矩形
        }

        // 选择数量
        Row {
            anchors.horizontalCenter: parent.horizontalCenter  // 居中对齐

            Image {
                id: selectImage
                source: "qrc:/jpg/music.png"
                width: 40
                height: 40
                fillMode: Image.PreserveAspectFit
            }

            ComboBox {
                id: beatSelector
                width: 178
                height: 40
                model: [1, 2, 3, 4, 5, 6, 7, 8]
                font.family: "宋体"
                font.pointSize: 15
                currentIndex: 3
                onActivated: {
                    beatCount = currentText
                    initBeats()
                }

                contentItem: Item { }

                background: Rectangle {
                    implicitWidth: 178
                    implicitHeight: 40
                    color: "transparent"
                    radius: 10

                    Image {
                        id: backImage
                        source: "qrc:/jpg/选项框终.png"
                        width: 178
                        height: 40
                    }

                    Text {
                        //anchors.centerIn: parent
                        x:82
                        y:14
                        text: beatSelector.currentText
                        font.family: "宋体"
                        font.pointSize: 15
                    }
                }
            }
        }

        Rectangle {
            width: 6
            height: 6  // 设置空隙的高度
            color: "transparent"  // 设置透明颜色，不显示矩形
        }

        // 节拍矩形
        Row {
            anchors.horizontalCenter: parent.horizontalCenter  // 居中对齐
            spacing: 5
            Repeater {
                model: beatCount
                delegate: Rectangle {
                    width: 50
                    height: 150
                    radius: 5
                    property int level: 1  // 0: silent, 1: weak, 2: medium, 3: strong
                    color: {
                        switch (level) {
                        case 0: return "white";
                        case 1: return "lightgray";
                        case 2: return "gray";
                        case 3: return "darkgray";
                        }
                    }
                    opacity: {
                        switch (level) {
                        case 0: return 0.2;
                        case 1: return 0.5;
                        case 2: return 0.7;
                        case 3: return 1.0;
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            level = (level + 1) % 4
                            beats[index].level = level
                        }
                    }

                    Rectangle {
                        id: beatIndicator
                        width: parent.width
                        height: parent.height * level / 3  // 确保空音的高度为 0
                        color: "blue"
                        anchors.bottom: parent.bottom
                        radius: parent.radius
                        opacity: 0.5  // 半透明的蓝色矩形

                        states: [
                            State {
                                name: "playing"
                                when: isPlaying && currentBeatIndex == index
                                PropertyChanges {
                                    target: beatIndicator
                                    color: "green"
                                }
                            }
                        ]
                        transitions: [
                            Transition {
                                from: ""
                                to: "playing"
                                PropertyAnimation { properties: "color"; duration: metronomeTimer.interval; easing.type: Easing.Linear }
                            }
                        ]
                    }
                }
            }
        }

        // 调节速度
        Row {
            anchors.horizontalCenter: parent.horizontalCenter  // 居中对齐
            spacing: 10

            Image {
                id: slideReduce
                source: "qrc:/jpg/减少.png"
                width: 30
                height: 30
                opacity: 1.0  // 初始透明度为1.0（完全不透明）

                // 为透明度添加缓动效果
                Behavior on opacity {
                    OpacityAnimator {
                        duration: 200  // 动画持续时间，单位为毫秒
                        easing.type: Easing.InOutQuad  // 缓入缓出效果
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        slideReduce.opacity = 0.3  // 按下时变为半透明
                    }
                    onReleased: {
                        slideReduce.opacity = 1.0  // 释放时恢复不透明
                        bpmSlider.value--
                    }
                }
            }


            Column{
                Rectangle {
                    width: 6
                    height: 6  // 设置空隙的高度
                    color: "transparent"  // 设置透明颜色，不显示矩形
                }
                Slider {
                    id: bpmSlider
                    from: 20
                    to: 300
                    value: 120
                    stepSize: 1  // 设置步长为1
                    onValueChanged: {
                        bpm = value
                        metronomeTimer.interval = 60000 / bpm
                    }
                }
            }

            Image {
                id: slideIncrease
                source: "qrc:/jpg/添加.png"
                width: 30
                height: 30

                Behavior on opacity {
                    OpacityAnimator{
                        duration: 200
                        easing.type: Easing.InOutQuad
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    onPressed: {
                        slideIncrease.opacity = 0.3
                    }
                    onReleased: {
                        slideIncrease.opacity = 1.0
                        bpmSlider.value++
                    }
                }
            }
        }

        Text {
            id: bpmSize
            text: bpmSlider.value
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "宋体"
            font.pointSize: 15
        }
        // 播放暂停
        Row {
            anchors.horizontalCenter: parent.horizontalCenter  // 居中对齐
            spacing: 10  // 设置为0或者根据需要调整间距

            Image {
                id: playPauseButton
                source: isPlaying ? "qrc:/jpg/暂停.png" : "qrc:/jpg/播放.png"
                width: 80  // 调整为适当的宽度
                height: 80  // 调整为适当的高度
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        isPlaying = !isPlaying
                    }
                }
            }
        }
    }
}
