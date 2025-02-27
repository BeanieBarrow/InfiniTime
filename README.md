# [BeanieBarrow's InfiniTime firmware](https://github.com/BeanieBarrow/InfiniTime)

Forked from [Commenter25's InfiniTime25](https://github.com/Commenter25/InfiniTime25)

My edited firmware for the [PineTime smartwatch](https://www.pine64.org/pinetime/), with changes I mostly bodged in from other forks, and from PRs that haven't made it to main.

## Changes

### Not stolen
  * Increase notif vibrate from 35ms to 300ms
  * Increase timer vibrate from 35ms to 1500ms
  * Change "volts" to "V" in the BatteryInfo app

### Stolen from [mashuptwice](https://github.com/mashuptwice/InfiniTime) (deleted account and repo)
  * Increase alarm timeout from 60s to 3m
  * Move Music to right of watch face
  * Start Music with volume buttons

### Stolen from [PrivateGER](https://github.com/PrivateGER/InfiniTime-Lacticum/)
  * Don't alert while charging
  * Add remaining time to Music
  * Add swiping indicator to Music
  * Swap notif indicator with a bell icon

### Stolen from upstream PRs
  * Tweak notifs for more text (InfiniTimeOrg#1422)
  * Simple calculator (InfiniTimeOrg#1483)

## How I built the project

1. Cloned the repo with submodule recursion `git clone --recurse-submodules -j8 https://github.com/BeanieBarrow/InfiniTime`
2. Downloaded the [gcc-arm-none-eabi-10.3-2021.10 toolchain](https://developer.arm.com/downloads/-/gnu-rm/10-3-2021-10)
3. Downloaded the [nRF5_SDK_15.3.0_59ac345 toolchain](https://www.nordicsemi.com/Products/Development-software/nRF5-SDK/Download#infotabs)
4. Extracted both to my `/opt` directory.
5. Ran the commands `export ARM_NONE_EABI_TOOLCHAIN_PATH=/opt/gcc-arm-none-eabi-10.3-2021.10` and `export NRF5_SDK_PATH=/opt/nRF5_SDK_15.3.0_59ac345`.
6. Ran the command `cmake -DARM_NONE_EABI_TOOLCHAIN_PATH=/opt/gcc-arm-none-eabi-10.3-2021.10/ -DNRF5_SDK_PATH=/opt/nRF5_SDK_15.3.0_59ac345/ -DBUILD_DFU=1` in the root directory of the repo
7. Ran the command `make -j pinetime-mcuboot-app`
8. Transferred the firmware (`pinetime-mcuboot-app-dfu-1.13.0.zip`) to my PineTime using [WatchMate](https://github.com/azymohliad/watchmate).

---

Everything below is the original README, for convenience.

---

## [InfiniTime](https://github.com/InfiniTimeOrg)

## New to InfiniTime?

  - [Getting started with InfiniTime](doc/gettingStarted/gettingStarted-1.0.md)
  - [Updating the software](doc/gettingStarted/updating-software.md)
  - [About the firmware and bootloader](doc/gettingStarted/about-software.md)

### Companion apps

  - [Gadgetbridge](https://gadgetbridge.org/) (Android)
  - [AmazFish](https://openrepos.net/content/piggz/amazfish/) (SailfishOS)
  - [Siglo](https://github.com/alexr4535/siglo) (Linux)
  - [InfiniLink](https://github.com/InfiniTimeOrg/InfiniLink) (iOS) **[Looking for a new maintainer]**
  - [ITD](https://gitea.arsenm.dev/Arsen6331/itd) (Linux)

## Development

  - [InfiniTime Vision](doc/InfiniTimeVision.md)
  - [Rough structure of the code](doc/code/Intro.md)
  - [How to implement an application](doc/code/Apps.md)
  - [Generate the fonts and symbols](src/displayapp/fonts/README.md)
  - [Tips on designing an app UI](doc/ui_guidelines.md)
  - [Bootloader, OTA and DFU](bootloader/README.md)
  - [External resources](doc/ExternalResources.md)
  - [Versioning](doc/versioning.md)
  - [Project branches](doc/branches.md)
  - [Files included in the release notes](doc/filesInReleaseNotes.md)

### Contributing

  - [Coding conventions](doc/coding-convention.md)

### Build, flash and debug

  - [InfiniTime simulator](https://github.com/InfiniTimeOrg/InfiniSim)
  - [Build the project](doc/buildAndProgram.md)
  - [Build the project with Docker](doc/buildWithDocker.md)
  - [Build the project with VSCode](doc/buildWithVScode.md)
  - [Flash the firmware using OpenOCD and STLinkV2](doc/openOCD.md)
  - [Flash the firmware using SWD interface](doc/SWD.md)
  - [Flash the firmware using JLink](doc/jlink.md)
  - [Flash the firmware using GDB](doc/gdb.md)
  - [Stub using NRF52-DK](doc/PinetimeStubWithNrf52DK.md)

### API

  - [BLE implementation and API](doc/ble.md)

### Architecture and technical topics

  - [Memory analysis](doc/MemoryAnalysis.md)

## Licenses

This project is released under the GNU General Public License version 3 or, at your option, any later version.

It integrates the following projects:

  - RTOS : **[FreeRTOS](https://freertos.org)** under the MIT license
  - UI : **[LittleVGL/LVGL](https://lvgl.io/)** under the MIT license
  - BLE stack : **[NimBLE](https://github.com/apache/mynewt-nimble)** under the Apache 2.0 license
  - Font : **[Jetbrains Mono](https://www.jetbrains.com/fr-fr/lp/mono/)** under the Apache 2.0 license

## Credits

I’m not working alone on this project. First, many people create PR for this projects. Then, there is the whole #pinetime community : a lot of people all around the world who are hacking, searching, experimenting and programming the Pinetime. We exchange our ideas, experiments and code in the chat rooms and forums.

Here are some people I would like to highlight:

  - [Atc1441](https://github.com/atc1441/) : He works on an Arduino based firmware for the Pinetime and many other smartwatches based on similar hardware. He was of great help when I was implementing support for the BMA421 motion sensor and I²C driver.
  - [Koen](https://github.com/bosmoment) : He’s working on a firmware based on RiotOS. He integrated similar libs as me : NimBLE, LittleVGL,… His help was invaluable too!
  - [Lup Yuen Lee](https://github.com/lupyuen) : He is everywhere: he works on a Rust firmware, builds a MCUBoot based bootloader for the Pinetime, designs a Flutter based companion app for smartphones and writes a lot of articles about the Pinetime!
