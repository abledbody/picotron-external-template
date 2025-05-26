# Abledbody's External Development Template for Picotron

## How to use

1. Copy this directory to wherever you want the project to be.
2. Rename the directory and template.p64 to match the name of the project.
3. Open `template.p64/main.lua` and...
	- Change this line: `cd("/projects/template")` to point at the directory of your project, keeping the leading slash.
	- Change this line: `DATP = "template.p64/"` to match the name of the cartridge, keeping the trailing slash.

If you're using Visual Studio Code and would like to use LuaCATS definitions for Picotron, you can either put them in `C:\lualib\picotron-definitions`, or you can edit `settings.json` to point to the directory of your choice. I personally recommend cloning [Rayquaza01's definition files](https://github.com/Rayquaza01/picotron-definitions), but bear in mind that at time of writing, there are no fully complete and accurate definitions for Picotron, and Picotron itself is still in active development, so you may occasionally see warnings for things that are actually valid in Picotron.

## Important stuff

The entry point for your project's code is `src/main.lua`, rather than `template.p64/main.lua`. All scripts go into `src/` so that they are unaffected by Picotron's metadata management, and can live outside of `ram/cart` so that iterating on them does not require loading the cartridge more than once. When you are ready to distribute the cartridge, all you need to do is make sure there is a copy of your `src` directory at the root of the cartridge in `ram/cart` before you save or export it.

Whenever you want to refer to a file that lives in the cartridge, use `DATP..` as a prefix, such as `fetch(DATP.."gfx/0.gfx")`. This is because the working directory is different depending on where your `src` directory is. If `src` is at the root of the cartridge, the working directory will be `ram/cart`. Otherwise, it will be whatever you set it to in `main.lua`. `DATP` compensates for this by always pointing to the cartridge root.

## Trivia

This template is designed to be used with Sumneko's Lua language server extension for VSCode, and the [Lua Comments And Type System (LuaCATS) annotations](https://luals.github.io/wiki/annotations/) it provides.

This template comes with:
- [Kira's Error Explorer](https://www.lexaloffle.com/bbs/?pid=147383#p) (with thanks), because I find it invaluable, since as of 0.2.0d, Picotron's error handling is garbage.
- A `require` function, to work around how the lua language server does not recognize Picotron's `include` function. It's also just nicer for dependency management than `include`.

Picotron-specific operators such as `a \ b`, `a ..= b`, and `?x` are completely unrecognized by the Lua language server, and so will show errors, even if Picotron itself recognizes them. Each has a simple substitute. `a // b`, `a = a .. b`, and `print(x)`, respectively. One-line if statements such as `if (x) print(y)` are also unrecognized.

The ruler setting in `.vscode/settings.json` indicates where the horizontal boundary of the `code.p64` app is when using its monospace font, in case that's something you care about.