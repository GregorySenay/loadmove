# load and move bash command

Easy change directory command with aliases.
Save directy paths by aliases and able to move to it from anywhere using this alias.

Useful for changing directory from multi-terminals and save aliases between sessions.

## How to use

loadmove - (C) 2013-2017 Gregory Senay.
Released under the GNU GPL.

##load the script

Clone the directory `git clone https://github.com/GregorySenay/loadmove.git`.

The enter in the directory `cd loadmove`.

You have to add and `source` this script in your `~/.bashrc`:

```bash
echo "source `pwd`/loadmove.bash" >> ~/.bashrc
```

```bash
git clone https://github.com/GregorySenay/loadmove.git
cd loadmove
echo "source `pwd`/loadmove.bash" >> ~/.bashrc
```

or copy and paste in your .bashrc

```bash
source $LOADMOVE/loadmove.bash ```
where ``LOADMOVE`` is the directory of 'loadmove'.

##usage:

`load <alias>` To save path of the directory

Then change directory, go anywhere and enter:

`move <alias>`  To return the previous saved directory alias

`load -r <alias>`To delete the saved directory alias

`load -i <alias>` Show the path of the saved directory alias

`<alias>` can be any string


For example, I open a terminal and I go to a directory and need to enter the first time `cd /home/userX/Videos/movies/hollyday/2013/France/Marseille`.

Once inside I can enter the command with load to save the path with an alias ``load marseille2013``.

If I open an other terminal I can enter directly just to this directory by typing ``move marseille2013``.
This command will automatically do a ``cd /home/userX/Videos/movies/hollyday/2013/France/Marseille`.

All the directory can be listed by autocompletion ``move + <TAB>``.

If you want to remove an alias just use ``load -r <alias>`` like: ``load -r marseille2013``.

That's simple: ``load + move``.


