# Wanna try out C++26 reflection?

This repository provides a ready-to-use development container with an experimental GCC build that implements [P2996 (Reflection for C++26)](https://wg21.link/p2996). Get started with C++26 reflection features in minutes!

## Quick Start

### Prerequisites

Before using this project, ensure you have:

* **Git** – For cloning this repository
* **Docker** – For running the development container
* **VS Code** or **JetBrains CLion** (via **JetBrains Gateway**)

### Getting Started

1. Clone this repository:

   ```bash
   git clone git@github.com:MarioMottl/gcc-reflection-devcontainer.git
   cd gcc-reflection-devcontainer
   ```

2. Open in your preferred IDE:

   * **VS Code**: Follow the [VS Code Setup](#-vs-code-setup) section
   * **CLion**: Follow the [CLion Setup (via JetBrains Gateway)](#-clion-setup-via-jetbrains-gateway) section

## What’s Inside

This project includes:

* A simple C++26 reflection example in `src/main.cpp`
* Pre-configured CMake build system for experimenting with reflection
* Development container using an experimental GCC reflection build
* IDE configurations for both VS Code and CLion

### Example Code

The included example demonstrates basic reflection syntax following the P2996 proposal that has been voted into the C++26 standard:

```cpp
#include <print>

int main() {
    typename [:^^int:] const value = 42;
    std::println("The value is: {}", value);
}
```

## VS Code Setup

### Step 1: Install Required Extensions

Make sure you have the **Dev Containers** extension installed:

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Dev Containers" by Microsoft
4. Install the extension

### Step 2: Open in Dev Container

1. Open the project folder in VS Code
2. You should see a notification asking to "Reopen in Container"
3. Click **"Reopen in Container"**

   Alternatively, you can:

   * Press `Ctrl+Shift+P`
   * Type "Dev Containers: Reopen in Container"
   * Press Enter

### Step 3: Wait for Container Setup

The first time you open the project, Docker will:

* Pull the GCC reflection devcontainer image
* Set up the development environment
* Install and configure extensions

### Step 4: Build and Run

Once the container is ready:

1. **Configure CMake** (should happen automatically):

   * The project uses the pre-configured GCC reflection kit
   * CMake will generate build files in the `build/` directory

2. **Build the project**:

   * Press `Ctrl+Shift+P`
   * Type "CMake: Build"
   * Press Enter

3. **Run the example**:

   * Press `Ctrl+Shift+P`
   * Type "CMake: Run Without Debugging" (or "CMake: Debug")
   * Press Enter
   * If you see `The value is: 42`, you're all set.

## CLion Setup (via JetBrains Gateway)

### Step 1: Open JetBrains Gateway

1. Download and install **JetBrains Gateway** if you haven't already
2. Launch JetBrains Gateway

### Step 2: Create New Dev Container

1. In Gateway, select **"Dev Containers"** from the main menu
2. Click **"New Dev Container"**

### Step 3: Configure the Container

1. In the "New Dev Container" dialog:

   * Select **CLion** as your IDE

   * In the **Git Repository URL** field, paste the URL of this repository:

     ```text
     git@github.com:MarioMottl/gcc-reflection-devcontainer.git
     ```

   * Leave other settings as default

### Step 4: Build and Connect

1. Click **"Build Container and Continue"**
2. Gateway will:

   * Clone the repository
   * Build the dev container using the provided configuration
   * Launch CLion inside the container

### Step 5: Verify Setup

Once CLion opens in the container:

1. The project should automatically be configured with the GCC reflection toolchain
2. CMake should detect the configuration automatically
3. You can immediately start building and running the reflection example

### Step 6: Build and Run

1. **Build the project**:

   * Click the hammer icon in the toolbar
   * Or use **Build → Build Project** (Ctrl+F9)

2. **Run the example**:

   * Select the `main` run configuration from the dropdown
   * Click the green play button
   * Or press Shift+F10
   * If you see `The value is: 42`, everything is working.

## Useful Links

* [P2996 Reflection Proposal](https://wg21.link/p2996)
* [GCC Reflection Source (Marek’s branch)](https://forge.sourceware.org/marek/gcc/src/branch/reflection)

## Acknowledgements

This project is heavily inspired by the devcontainer setup created by [coder2k](https://github.com/mgerhold) for Bloomberg’s Clang P2996 environment.
Many of the configuration files (README, CMake) and ideas here are copied or adapted from their original work.

If you need a more in-depth README see: [mgerhold/reflection-dev-container](https://github.com/mgerhold/reflection-dev-container)