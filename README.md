# mac-tts

A lightweight text-to-speech (TTS) server for macOS, built with Swift and AVSpeechSynthesizer.

## Features
- Supports TCP server mode (`-p <port>`) for remote command execution.
- CLI interface via stdin.
- Configurable voice, speech rate, volume, and pitch.
- Minimal dependencies.

## Installation
```bash
git clone https://github.com/Daniil-Gusev/mac-tts.git
cd mac-tts
make install