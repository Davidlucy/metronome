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

## 许可证
本项目采用 MIT 许可证，详细信息请参见 LICENSE 文件。

## 联系信息
如有问题或建议，请联系 [2894812875@qq.com/vx:18939123945]。
