# Abledbody's External Development Template for Picotron

## How to use

1. Copy this directory to wherever you want the project to be.
2. Rename the directory and template.p64 to match the name of the project.
3. Open template.p64/main.lua and...
	- Change this line: `cd("/projects/template")` to point at the directory of your project.
	- Change this line: `DATP = "template.p64/"` as you did for step 2.

If you're using Visual Studio Code and would like to use definitions for Picotron, you can either put them in `C:\lualib\picotron`, or you can edit settings.json to point to the directory of your choice. I personally recommend cloning [Rayquaza01's definition files](https://github.com/Rayquaza01/picotron-definitions).

## Important stuff

The main script is `src/game.lua`. All scripts go into `src/` so that they are unaffected by Picotron's metadata management, and can live outside of `ram/cart` so that iterating on them does not require reloading the cartridge. When you are ready to distribute the cartridge, all you need to do is make sure there is a copy of your `src` directory at the root of the cartridge.

Whenever you want to refer to a file that lives in the cartridge, use `DATP..` as a prefix, such as `fetch(DATP.."0.gfx)`. This is because the working directory is different depending on where your `src` directory is. If `src` is at the root of the cartridge, the working directory will be `ram/cart`. Otherwise, it will be whatever you set it to in `main.lua`. `DATP` compensates for this by always pointing to the cartridge root.

## Trivia

This template comes with:
- [Kira's Error Explorer](https://www.lexaloffle.com/bbs/?pid=147383#p), because I find it invaluable, since as of 0.2.0d, Picotron's error handling is garbage.
- [Elgopher's `require` function](https://www.lexaloffle.com/bbs/?pid=143480#p), to work around how the lua language server does not recognize Picotron's `include` function. It's also just nicer for dependency management than `include`.

With thanks to both of them.

The ruler setting in `.vscode/settings.json` indicates where the horizontal boundary of the `code.p64` app is when using its monospace font, in case that's something you care about.