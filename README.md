# Coughing & Chopping

This is the main folder for my blog.

Currently, my blog appears on Scriptogram at http://scriptogr.am/guypursey

## Folders & files

Here is the directory structure:

/.
|__ /archives
|__ /drafts
|__ /posted
|___.gitignore
|__ autoscrp.sh
|__ README.md


### `/archives`

This folder will likely remain empty, unless I decide to share my writing process more generally. Locally, it contains Git repositories for all the posts I have published.

### `/drafts`

This folder will also likely remain empty for the same reason. Part of my publishing process is the transfer of a folder from `/drafts` to `/archives` so that I know it's out there. I can still make changes, corrections, etc. But it keeps files that I know are work in progress separate from files I know I've put out there.

### `/posts`

This folder will contain all the Markdown files that make up my blog. It's a duplicate of the content on Scriptogram without any of the bumpf.

### `.gitignore`

Ensuring local files with all the drafting and editing that went into them stay local. Also ensures that keys required for Scriptogram remain private.

### `autoscrp.sh`

This is the script which pushes a post to Scriptogram, pulling in the metadata as it goes.

### `README.md`

You are reading this file now.

## Absent files

If you want to use the same approach to your blog, with Scriptogram, you will need:

 - A Scriptogram account.
 - An "application" added to your account that allows you to post.
 - Two files described below.

### `scrpakey.txt`

This should contain your application key which you'll get upon adding the "application" mentioned above. It should contain nothing else, no spaces, no line breaks, nothing.

### `scrpuser.txt`

This should contain your Scriptogram user ID, which you should find under "Settings" when you login to Scriptogram. It should contain nothing else, no spaces, no line breaks, nothing.

