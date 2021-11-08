# 002
*the easy way to avoid naming a project*

## What this is
A tile based game! Advanced wars inspired, possibly?

Right now, I'm simply making tools to make a good tile based game easily. What I choose to do with it is still in the air, pending inspiration. I just don't want to be held back by not wanting to implement difficult tasks.

## How you can help
Ideas, improvements, always helpful. Got an MR? I don't mind.

## Getting Started

### Pico-8
Plopping this repo in your carts folder should work fine.
- `load main.p8` and `run`

### Love2D

#### Prerequisites
- [Love2D](https://love2d.org/)
- [Aseprite](https://www.aseprite.org/)

#### Export Spritesheet
I use aseprite to build the spritesheet, each layer representing a different sprite.
When exporting a usable spritesheet for love to pick up, I use the following settings
- Layout
  - Sheet Type: Horizontal Strip
- Sprite
  - Layers: Visible Layers
  - [X] Split layers
- Output
  - [X] Output File `tileset.png`
  - [X] JSON Data `tileset.json`
  - Item Filename `{layer}`

#### Running
After exporting the spritesheet, things should be usable. Simply use `love .` within the directory to run the game.

## Code style
While it's clear I'm not following any guides for coding style, I am attempting to follow some rules of thumb
- Avoid long lines
  - Try to keep things to a statement per line.
- Avoid bad names
  - Proper named variables are more helpful to come back to. If pico-8 hits a character count limit, then I might as well make an obfuscation script to build the cart rather than modify the code to fit.
- Ensure compatibility
  - Pico-8 adds some fancy syntax to lua to cut down on tokens and make tiny code a little more possible. Since this will work in love2D as well, we need to avoid using those. This will suck for pico-8, but will probably be less effort in the long run.
- Maybe actually comment on things
  - I'm not great at explaining things, but since this is going to be a bit more open to the public to show off, I should make an attempt here.

## To-do
- [ ] Do comments apply to character limits in pico-8? (Probably)
- [ ] Map editor
  - [ ] Dynamic tile connecting
- [ ] Draw sprites in layers to allow for effects not winding up behind tiles
- [ ] Love2d support at higher resolutions
  - [ ] Probably some form of letterboxing and zooming
  - [ ] Rename tilesheet to spritesheet?
- [ ] Gameplay?
