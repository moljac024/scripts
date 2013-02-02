#!/bin/sh

# Diskspace in Openbox
# pipe menu script
# current version at http://chaingang.org/code/linux/obscripts/diskspace.sh
# in ~/.config/openbox/menu.xml
# add <menu id="gnome-menus" label="Gnome" execute="~/.config/openbox/pipemenus/diskspace.sh" />
#
# Copyright 2008 Baavgai (baavgai@chaingang.org)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


df -kT | awk 'BEGIN { print "<openbox_pipe_menu>"; 
		itemFmt="<item label=\"%s: %s\"><action name=\"Execute\"><command>true</command></action></item>\n";
		itemFmt2="<item label=\"%s: %dKB\"><action name=\"Execute\"><command>true</command></action></item>\n";
		menuFmt="<menu id=\"fs_menu_%s\" label=\"%7.2fGB %s\">\n";
		menuNum=0;
		}
	$0 ~ "dev" { 
		menuNum = menuNum + 1;
		printf(menuFmt, menuNum, $5 / 1048576, $7);
		printf(itemFmt, "Filesystem", $1);
		printf(itemFmt, "Type", $2);
		printf(itemFmt2, "Size", $3/1024);
		printf(itemFmt2, "Used", $4/1024);
		printf(itemFmt2, "Avail", $5/1024);
		printf(itemFmt, "Use%", $6);
		printf(itemFmt, "Mounted on", $7);
		print "</menu>";
	}
	END { print "</openbox_pipe_menu>" }
	'
