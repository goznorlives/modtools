# Minetest Mod Management Scripts
 
Linux BASH scripts for managing and updating Minetest mods with git. Derived from work I did on a modpack before I realized that you can't access a modpack from within a modpack... Oops.

* import.sh: import a mod into your Minetest mods directory
* importall.sh: import all of the mods in modlist.txt at once
* update.sh: update one mod from its remote
* updateall.sh: update all of the mods in modlist.txt from their remotes
* delete.sh: delete a named mod (not that I expect anyone would need it)
* lsmods.sh: list mods in mod list
* addmod.sh: add a mod to the mod list
* rmmod.sh: remove a mod from the mod list

Configuration:
* Required environment variables:
    * MINTETEST_HOME - Path to the directory where Minetest stores worlds, mods, 
      etc.
    * MODTOOLS_HOME - Path to the directory containing these scripts.
* .config/config: configuration
    * MODS_ROOT - path to .minetest/mods
* .config/modlist.txt: list of mods that have been/will be imported.
