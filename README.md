# VanillaPlus

Minecraft server that adds some utility features including BungeeCord IP forward support from Vanilla, without touching any game mechanism.

## Features
* No GUI by default, add `-gui` option to enable GUI
* IP forward support, set `bungeecord=true` in `server.properties` to enable it
* (TODO) jline console input
More features maybe added in the future.

## Version
Currently only 1.14.4 was tested.

## Build
To build it, you first need to get the Vanilla server of corresponding version, remapping it using the deobfuscation map provided by Mojang to `decomp/remapped.jar`, then decompile
* Download Vanilla server of the corresponding version;
* Remap it using the deobfuscation map provided by Mojang and save the remapped jar to `decomp/remapped.jar`;
* Decompile the remapped jar using [Fernflower](https://github.com/fesh0r/fernflower), save the source files to `decomp/src/`;
* Run the following commands: 
```sh
mkdir -p src/main/java
./applyPatches.sh src/main/java decomp/src patches
./gradlew patchJar
```
Then the output is in `/build/libs/`.