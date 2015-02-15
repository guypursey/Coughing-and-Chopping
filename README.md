# Coughing & Chopping

v0.0.7

This repository represents elements of a workflow I use for blogging.

Currently, my blog appears on Scriptogram at http://scriptogr.am/guypursey

## Dependencies

This workflow relies on Git for versioning.

## Set-up

Currently this workflow depends on posting to Scriptogram. You can either:

 - Comment out the relevant line in `publish.sh`, or:
 - Create three text files called `scrpakey.txt`, `scrpuser.txt` and `scrpname.txt` containing the application key, user ID and username of your account respectively. Further details are given in [the section on "Absent Files"](#absent-files) below.

## Usage

 - Create a new draft by using `newdraft.sh` followed by name of folder to appear in `./drafts/`.
 - Edit the main `.md` file in the folder to start writing your post in Markdown.
 - Precede relative links with `/$/`.
 - Precede local image references (for images in the `images` folder) with `/!/`.
 - Add a keyword to each line of `tags.txt`.
 - Commit amendments to your post and track your progress. Each draft folder is its own Git repository.
 - Publish the post using `publish.sh`, which will move your folder from `./drafts` to `./archives` and create a copy of the post in `./posted`.

You can optionally set the date of publishing by putting an ISO format date into a file called `date.txt` in your draft folder. If you don't do this, one will be creating automatically when you publish.

## Folders & files

Here is the directory structure:

	/.
	|__ /archives
	|__ /drafts
	|__ /images
	|__ /posted
	|__ .gitignore
	|__ archive.sh
	|__ autoscrp.sh
	|__ newdraft.sh
	|__ publish.sh
	|__ README.md


### `/archives`

This folder will likely remain empty, unless I decide to share my writing process more generally. Locally, it contains Git repositories for all the posts I have published.

### `/drafts`

This folder will also likely remain empty for the same reason. Part of my publishing process is the transfer of a folder from `/drafts` to `/archives` so that I know what's out there and what still requires work. I can still make changes, corrections, etc. But it keeps files that I know are work in progress separate from files I know I've put out there.

### `/images`

This folder is a placeholder for images. It contains a `README` and can be used to house images to be used in posts. It should contain a file called `imagemap.csv` containing information about where images are hosted online. Further information below.

### `/posted`

This folder will contain all the Markdown files that make up my blog (as soon as I've worked out an appropriate license). It's a duplicate of the content on Scriptogram without any of the bumpf.

### `.gitignore`

Ensuring local files with all the drafting and editing that went into them stay local. Also ensures that keys required for Scriptogram remain private.

### `archive.sh`

This is the script which moves a folder from `drafts` to `archives` and renames it, as well as the file within, for when a post has been published. A copy of the file by itself is also made in `posted`.

### `autoscrp.sh`

This is the script which pushes a post to Scriptogram, creating or pulling in the metadata as required.

### `newdraft.sh`

This is the script which creates a new draft folder with an empty .md file in it ready for writing. The draft folder is initiated as a Git Repository.

### `publish.sh`

This single file can be used to archive a piece and push it out to Scriptogram in one command.

### `README.md`

You are reading this file now.

## Absent files

If you want to use the same approach to your blog, with Scriptogram, you will need:

 - A Scriptogram account.
 - An "application" added to the Scriptogram account that allows you to post.
 - Two files described below.

If you want to use images in your posts, you can store them in the `/images` folder but you will need to map them with a file called `imagemap.csv` which is described below.

### `scrpakey.txt`

This should contain the application key for Scriptogram which can be got by adding the "application" mentioned above. It should contain nothing else, no spaces, no line breaks, nothing.

### `scrpuser.txt`

This should contain the Scriptogram user ID, which you should find under "Settings" when you login to Scriptogram. It should contain nothing else, no spaces, no line breaks, nothing.

### `scrpname.txt`

This contains the actual username which appears in the Scriptogram address, used for the purposes of crosslinking.

### `images/imagemap.csv`

This file should contain the filenames of any images in the `/images` folder where it sits, followed by a comma and then the address of where that image is hosted online. Each file and address pair should sit on a separate line. If using Picasa (as the scripts are currently set up to do), this file should be handled automatically.

