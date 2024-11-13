# CMake Template

This is a beginner friendly `cmake` for `C` projects. while it's not by all means the **"best"** approach but it's clearly crafted together and commented for you to be able to adjust it to your needs.

## Structure

- `cmake` any utility and re-usable files for your cmakes goes here.
- `extern` folder is where you put your external dependencies, as an example I have used `clove-unit` library for unit testing.
- `include` is where you put your exported header files.
- `src` is where your `.c` files must be placed.
- `tests` are written using `clove-unit` framework which is a lightweight and single header library.

**👉 NOTE:** You can refer to [here](https://github.com/fdefelici/clove-unit) for more information about `clove-unit`.

**👉 NOTE:** There is also `.clang-format` available for you to use.

**👉 NOTE:** All the build artifacts will be placed in `out` folder, all the build artifacts for tests will be placed in `out_tests` folder.

## `CMakeLists.txt` files

By reading their source codes as they are fully commented you can understand pretty much everything you need.

But the main workflow of using this template is like this:

- in main `CMakeLists.txt`:
  1. Rename project name  in [line 12](/CMakeLists.txt#L12).
  2. Rename your desired executable file `main_exe_file` on lines [20](/CMakeLists.txt#L20), [25](/CMakeLists.txt#L25), [37](/CMakeLists.txt#L37) and [46](/CMakeLists.txt#L46).
  3. Every time you add a new `.c` file you add it in `EXECUTABLE TARGETS` section to one or more of your executable files.
  4. If you want to add another Target aka. executable or library feel free to repeat what's on lines [20 to 23](/CMakeLists.txt#L20-L23) also make sure to rename the variables to meet your needs.
  5. In case you want also to enable pre build testing meaning re-building and running tests every time you build certain target look at [line 37](/CMakeLists.txt#L37).

- Testing (`tests/CMakeLists.txt`):
  1. You create a new `.c` file in `tests` folder, name it like `test_<whatever>.c`, it's for readability but you don't have to.
  2. Follow `clove-unit` library guide and write your test.
  3. use `add_clove_test` with the exact name `test_<whatever>` without `.c` in `CMakeLists.txt` of `tests` directory to register your test.
  4. **👉 NOTE:** Make sure to [read the guide](/tests/CMakeLists.txt#L15-L22) in the `tests` folder cmake file.

- Visual Studio Code Users:
  1. Make sure [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) and [CMake Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools) extensions are installed.
  2. If you're on Windows and you haven't installed your tools yet, make sure to check out [here](https://github.com/dezashibi-c/b-hello-world?tab=readme-ov-file#portable-development-environment-for-windows-users).
  3. Just open the folder like normal and let the magic happen.

- CodeBlocks and Visual Studio 2022 Users:
  1. You need to create corresponding projects first.
  2. Open terminal in the folder (make sure you've deleted `build` folder if it already exists):
     1. Enter `cmake -B build -G"CodeBlocks - Unix Makefiles"` if you need CodeBlocks project.
     2. Enter `cmake -B build -G"Visual Studio 17 2022"` if you need Visual Studio project.
  3. Now open up the `build` folder and you can find project or solution for your IDE.

- KDevelop Users just open the folder and the IDE itself recognizes the `CMakeLists.txt` and will guide you through it.

- **Adding Configurations to define macros**:

    You can use `define_macro_option(<target name> <macro name in your code> <default value ON/OFF>)` after your executables or libraries. this will add `<target name>_ENABLE_<macro name you've provided>` cmake option.

    **👉 Example:** Checkout [usage example](/CMakeLists.txt#L25) and its corresponding effect in [the main source](/src/main.c#L10-L12).

- **Adding post build file copy**:
  
    You can use `define_post_built_copy(<target name> <relative destination> <files...>)` to enable copying of any files relative to
    executables or libraries.

    **👉 NOTE:** no `./` is needed in destination, pass `""` if you want the files being copied to the root of the output directory.

    **👉 Example:** Checkout [usage example](/CMakeLists.txt#L42-L44).

## `Raylib` Helper

Looking at the official cmake template of the `raylib` I thought it might be good to add it to my template as well.

As it is mentioned in the [line 7](/CMakeLists.txt#L7) you can remove that line when your project don't need raylib.

Enabling `raylib` is as simple as just using `enable_raylib_for` command like `enable_raylib_for(game_example)` at [line 31](/CMakeLists.txt#L31).

**👉 NOTE:** To include and manage your resources, use resources folder with a subfolder per game project.

## Resources for learning `CMake`

Check out [this place](https://cliutils.gitlab.io/modern-cmake/README.html). it's a good book and I highly recommend you to read it if you want to get more into cmake.

## Third-party Libraries

- [Clove-Unit](https://github.com/fdefelici/clove-unit) ([MIT License - Copyright (c) 2021-2024 Federico De Felici](/extern/clove-unit/LICENSE))

## License

BSD 3-Clause License

Copyright (c) 2024, Navid Dezashibi <navid@dezashibi.com>

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
