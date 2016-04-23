# load and move bash command

This tool helps to eays navigate in a multi terminal environment.
It can save many directy paths with alias and move to it in a short command

## How to use

load move - (C) 2013-2016 Gregory Senay.
Released under the GNU GPL.
``
usage:
load <name>  To save path of the directory

Then change directory, go anywhere

move <name>\t To return the previous saved directory <name>
load -r <name> \t To delete the saved directory name
load -i <name> \t Show the path of the saved directory name
<name> can be any string
``

For example, I open a terminal and I go to a directory and need to enter the first time `cd /home/userX/Videos/movies/hollyday/2013/France/Marseille`.

Once inside I can enter the command with load to save the path with an alias ``load marseille2015``.

If I open an other terminal I can enter directly just to this directory by typing ``move marseille2015``.
This command will automatically do a ``cd /home/userX/Videos/movies/hollyday/2013/France/Marseille`.

All the directory can be listed by autocompletion ``mode + <TAB>``.

If you want to remove an alias just use ``load -r <name>`` like: ``load -r marseille2015``.

That's simple: ``load + move``.


