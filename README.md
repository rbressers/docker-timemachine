# Docker Time Machine

A lightweight, Samba based Time Machine server for macOS, optimized for performance and stability. Built on Alpine using Samba 4.22.

## Why this image?
* Lightweight: Based on Alpine Linux (~20MB image size).
* Performance: Pre-configured with `vfs_fruit`, `aio`, and `sendfile` for maximum throughput.
* Auto-Discovery: Includes `Avahi` (mDNS) and a custom service profile so your Mac sees a Time Capsule in Finder automatically.
* Configurable: User, Password, Quota, and Server Name via Environment Variables.
