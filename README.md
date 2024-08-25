# CMake Template

This is a beginner friendly `cmake` for `C` projects. while it's not by all means the **"best"** approach but it's clearly crafted together and commented for you to be able to adjust it to your needs.

## Structure

- `extern` folder is where you put your external dependencies, as an example I have used `clove-unit` library for unit testing.
- `include` is where you put your exported header files.
- `src` is where your `.c` files must be placed.
- `tests` are written using `clove-unit` framework which is a lightweight and single header library. you can refer to [here](https://github.com/fdefelici/clove-unit) for more information.

**👉 NOTE:** there is also `.clang-format` available for you to use.

## `CMakeLists.txt` files

By reading their source codes as they are fully commented you can understand pretty much everything you need.

## Resources

I've get the good test run control [from this place](https://cliutils.gitlab.io/modern-cmake/chapters/testing.html). it's a good book and I highly recommend you to read it if you want to get more into cmake.

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
