# Minetest Mod Management Scripts
 
Scritps for managing and updating Minetest mods with git. Derived from work I did on a modpack before I realized that you can't access a modpack from within a modpack... Oops.

* modlist.txt: list of mods in <modname> <git repo URL> format
* import.sh: import a mod into your Minetest mods directory
* importall.sh: import all of the mods in modlist.txt at once
* update.sh: update one mod from its remote
* updateall.sh: update all of the mods in modlist.txt from their remotes
* delete.sh: delete a named mod (not that I expect anyone would need it)
