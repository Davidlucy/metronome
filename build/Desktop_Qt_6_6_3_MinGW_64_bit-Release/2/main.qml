import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia

ApplicationWindow {
    visible: true
    width: 500
    height: 400
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
        source: "qrc:/wav/你好.wav"
    }

    SoundEffect {
        id: mediumBeat
        source: "qrc:/wav/警报.wav"
    }

    SoundEffect {
        id: strongBeat
        source: "qrc:/wav/蟋蟀.wav"
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

    // 将背景图片添加到布局的底层
    Image {
        id: backgroundImage
        source: "qrc:/jpg/th.png"  // 背景图像路径
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop  // 使图片填满窗口并保持宽高比
    }

    Column {
        anchors.fill: parent
        spacing: 20

        Rectangle {
                width: 30
                height: 6  // 设置空隙的高度
                color: "transparent"  // 设置透明颜色，不显示矩形
        }

        // 选择数量
        Row {
            anchors.horizontalCenter: parent.horizontalCenter  // 居中对齐

            Image {
                id: selectImage
                source: "qrc:/jpg/音乐.png"
                width: 40
                height: 40
                fillMode: Image.PreserveAspectFit
            }
            ComboBox {
                id: beatSelector
                width: 178
                height: 40
                model: [1, 2, 3, 4, 5, 6, 7, 8]
                currentIndex: 3
                onActivated: {
                    beatCount = currentText
                    initBeats()
                }
            }
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

            Text {
                text: "BPM:"
            }

            MouseArea {
                width: 20
                height: 20
                onClicked: {
                    bpmSlider.value = Math.max(bpmSlider.from, bpmSlider.value - 1);
                    bpm = bpmSlider.value;
                    metronomeTimer.interval = 60000 / bpm;
                }

                Image {
                    source: "qrc:/jpg/减少.png"  // 加减按钮图像路径
                    width: 25
                    height: 25
                    fillMode: Image.PreserveAspectFit
                }
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

            MouseArea {
                width: 20
                height: 20
                onClicked: {
                    bpmSlider.value = Math.min(bpmSlider.to, bpmSlider.value + 1);
                    bpm = bpmSlider.value;
                    metronomeTimer.interval = 60000 / bpm;
                }

                Image {
                    source: "qrc:/jpg/添加.png"  // 加减按钮图像路径
                    width: 25
                    height: 25
                    fillMode: Image.PreserveAspectFit
                }
            }

            Text {
                text: bpmSlider.value
            }
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
