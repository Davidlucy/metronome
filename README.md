# Metronome

## 项目简介
Metronome 是一个基于 Qt 的节拍器应用程序，使用 QML 和 C++ 开发。该应用程序允许用户设置节拍数量和每分钟节拍数 (BPM)，并通过不同的音效来指示节拍。

## 版本
当前版本：0.1

## 构建说明

### 先决条件
- CMake 版本：3.16 或更高
- Qt 版本：6.2 或更高，包含 Quick 和 Multimedia 模块

### 构建步骤
1. 克隆此仓库：
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. 创建构建目录并进入：
   ```bash
   mkdir build
   cd build
   ```

3. 运行 CMake 配置：
   ```bash
   cmake ..
   ```

4. 构建项目：
   ```bash
   cmake --build .
   ```

5. 运行应用程序：
   ```bash
   ./app2
   ```

## 使用说明
- 启动应用程序后，您可以通过下拉菜单选择节拍数量。
- 使用滑块调节每分钟节拍数 (BPM)。
- 点击节拍矩形以更改其音效级别（静音、弱、中、强）。
- 点击播放/暂停按钮以开始或停止节拍。

## 项目展示
![项目展示图片1](/jpg/1.png)
![项目展示图片2](/jpg/2.png)


## 核心代码展示
```qml
ApplicationWindow {
    // 应用程序窗口的基本设置
    visible: true
    width: 500
    height: 460
    title: "Metronome"

    property int beatCount: 4  // 节拍数量
    property int bpm: 120  // 每分钟节拍数
    property var beats: []  // 存储节拍的数组
    property int currentBeatIndex: 0  // 当前节拍索引
    property bool isPlaying: false  // 播放状态

    Timer {
        id: metronomeTimer
        interval: 60000 / bpm  // 根据 BPM 计算定时器间隔
        repeat: true
        running: isPlaying  // 根据播放状态控制定时器
        onTriggered: {
            // 当定时器触发时播放当前节拍的音效
            if (beats[currentBeatIndex].level != 0) {
                playSound(beats[currentBeatIndex].level);
            }
            currentBeatIndex = (currentBeatIndex + 1) % beats.length;  // 循环更新当前节拍索引
        }
    }

    function initBeats() {
        // 初始化节拍数组
        beats = []
        for (var i = 0; i < beatCount; ++i) {
            beats.push({level: 1})  // 默认每个节拍的音效级别为 1
        }
        currentBeatIndex = 0;  // 重置当前节拍索引
    }
    Component.onCompleted: initBeats()  // 组件完成时初始化节拍

    function playSound(level) {
        // 根据音效级别播放相应的音效
        switch (level) {
        case 1:
            weakBeat.play();  // 弱音效
            break;
        case 2:
            mediumBeat.play();  // 中音效
            break;
        case 3:
            strongBeat.play();  // 强音效
            break;
        }
    }
}
```

## 图片来源
图片由阿里巴巴矢量图标库提供，来源https://www.iconfont.cn/?spm=a313x.home_index.i3.d4d0a486a.4bee3a81WCUu6p，大家可以更改。

## qmake 使用说明
若使用qmake，请在pro文件里添加QT+=core quick 等关键部分。

## 许可证
本项目采用 MIT 许可证，详细信息请参见 LICENSE 文件。

## 联系信息
如有问题或建议，请联系 [2894812875@qq.com/vx:18939123945]。
