# Coughing & Chopping

This repository represents elements of a workflow I use for blogging.

Currently, my blog appears on Scriptogram at http://scriptogr.am/guypursey

## Folders & files

Here is the directory structure:

	/.
	|__ /archives
	|__ /drafts
	|__ /posted
	|__ .gitignore
	|__ autoscrp.sh
	|__ README.md


### `/archives`

This folder will likely remain empty, unless I decide to share my writing process more generally. Locally, it contains Git repositories for all the posts I have published.

### `/drafts`

This folder will also likely remain empty for the same reason. Part of my publishing process is the transfer of a folder from `/drafts` to `/archives` so that I know what's out there and what still requires work. I can still make changes, corrections, etc. But it keeps files that I know are work in progress separate from files I know I've put out there.

### `/posts`

This folder will contain all the Markdown files that make up my blog (as soon as I've worked out an appropriate license). It's a duplicate of the content on Scriptogram without any of the bumpf.

### `.gitignore`

Ensuring local files with all the drafting and editing that went into them stay local. Also ensures that keys required for Scriptogram remain private.

### `autoscrp.sh`

This is the script which pushes a post to Scriptogram, pulling in the metadata as it goes.

### `README.md`

You are reading this file now.

## Absent files

If you want to use the same approach to your blog, with Scriptogram, you will need:

 - A Scriptogram account.
 - An "application" added to the Scriptogram account that allows you to post.
 - Two files described below.

### `scrpakey.txt`

This should contain the application key for Scriptogram which can be got by adding the "application" mentioned above. It should contain nothing else, no spaces, no line breaks, nothing.

### `scrpuser.txt`

This should contain the Scriptogram user ID, which you should find under "Settings" when you login to Scriptogram. It should contain nothing else, no spaces, no line breaks, nothing.

