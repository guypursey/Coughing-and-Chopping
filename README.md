# `ahem`

v0.1.1

This repository represents elements of a workflow I use for blogging.

Currently, my blog appears on Scriptogram at http://scriptogr.am/guypursey

## Dependencies

This workflow relies on Git for versioning.

## Set-up

Currently this workflow depends on posting to Scriptogram. You can either:

 - Comment out the relevant line in `/code/publish.sh`, or:
 - Create three text files called `scrpakey.txt`, `scrpuser.txt` and `scrpname.txt` in the folder `/userdata/scriptogram` containing the application key, user ID and username of your account respectively. Further details are given in [the section on "Absent Files"](#absent-files) below.

## Usage

 - Create a new draft by using `/code/newdraft.sh` followed by name of folder to appear in `content/drafts/`.
 - Edit the main `.md` file in the newly created folder to start writing your post in Markdown.
 - Precede relative links with `/$/`.
 - Precede local image references (for images in the `/content/images` folder) with `/!/`.
 - Add a keyword to each line of `tags.txt` in your newly created draft folder.
 - Commit amendments to your post and track your progress. Each draft folder is its own Git repository.
 - Publish the post using `/code/publish.sh` following by the name of the relevant folder, which will move your folder from `./drafts` to `./archives` and create a copy of the post in `./posted`.

You can optionally set the date of publishing by putting an ISO format date into a file called `date.txt` in your draft folder. If you don't do this, one will be creating automatically when you publish.

## Example

While in the root of the repository:

    /code/newdraft.sh new-blog-post
    echo "# My new blog post" >> /content/drafts/new-blog-post/new-blog-post.md
    echo "Testing this out." >> /content/drafts/new-blog-post/new-blog-post.md
    echo "testing" >> /content/drafts/new-blog-post/tags.txt
    echo "2015-03-08 12:04" > /content/drafts/new-blog-post/date.txt
    /code/publish.sh new-blog-post


## Folders & files

Here is the directory structure:

	/.
	|__ /code
		|__ /picasa
			|__ authenticate-as-device.sh
			|__	poll-for-access-token.sh
			|__	post-image.sh
			|__	refresh-access-token.sh
		|__ /scriptogram
			|__ autoscrp.sh
		|__ archive.sh
		|__ newdraft.sh
		|__ publish.sh
	|__ /content
		|__ /archives
		|__ /drafts
		|__ /images
		|__ /posted
	|__ /userdata
		|__ /picasa
		|__ /scriptogram
	|__ .gitignore
	|__ README.md


There are also `README` files besides the root-level one in some of the folders which aren't listed above, so as to make the directory structure clearer.

### `/code`

This folder contains all the scripts that take care of this model of writing, versioning and publishing content.

### `/code/picasa`

This folder contains any code dealing with publishing images to a specified Picasa account.

### `/code/picasa/authenticate-as-device.sh`

This script deals with authenticating this code with your Picasa account.

### `/code/picasa/poll-for-access-token.sh`

This script deals with obtaining an access token for publishing to a Picasa account.

### `/code/picasa/post-image.sh`

This script deals with posting an image to a Picasa account and storing the URL returned in an image map (csv file) in the `userdata/picasa` folder.

### `/code/picasa/refresh-access-token.sh`

This script uses the refresh token stored in `userdata/picasa` to get a new access token. Essential for one an access token expires.

### `/code/scriptogram`

This folder contains any code dealing with posting to Scriptogram via its API.

### `/code/scriptogram/autoscrp.sh`

This is the script which pushes a post to Scriptogram, creating or pulling in the metadata as required.

### `/code/archive.sh`

This is the script which moves a folder from `drafts` to `archives` and renames it, as well as the file within, for when a post has been published. A copy of the file by itself is also made in `posted`.

### `/code/newdraft.sh`

This is the script which creates a new draft folder with an empty .md file in it ready for writing. The draft folder is initiated as a Git Repository.

### `/code/publish.sh`

This single file can be used to archive a piece and push it out to Scriptogram in one command.


### `/content`

This folder shoul contain all the content for your project/blog.

### `/content/archives`

This folder will likely remain empty, unless I decide to share my writing process more generally. Locally, it contains Git repositories for all the posts I have published.

### `/content/drafts`

This folder will also likely remain empty for the same reason. Part of my publishing process is the transfer of a folder from `/drafts` to `/archives` so that I know what's out there and what still requires work. I can still make changes, corrections, etc. But it keeps files that I know are work in progress separate from files I know I've put out there.

### `/content/images`

This folder is a placeholder for images. It contains a `README` and can be used to house images to be used in posts. It should contain a file called `imagemap.csv` containing information about where images are hosted online. Further information below.

### `/content/posted`

This folder will contain all the Markdown files that make up my blog (as soon as I've worked out an appropriate license). It's a duplicate of the content on Scriptogram without any of the bumpf.

### `/userdata`

This folder is for storing account details which should not be shared more widely (access tokens, user and client IDs, client secrets, and so on).

### `/userdata/picasa`

Account data for Picasa. Should not be versioned or stored remotely; keep local.

### `/userdata/scriptogram`

Account data for Scriptogram. Should not be versioned or stored remotely; keep local.

### `.gitignore`

Ensuring local files with all the drafting and editing that went into them stay local and hopefully helping to ensure that account details stay local and private.

### `README.md`

You are reading this file now.

## Essential but absent files

If you want to use the same approach to your blog, with Scriptogram, you will need:

 - A Scriptogram account.
 - An "application" added to the Scriptogram account that allows you to post.
 - Two files described below.

If you want to use images in your posts, you can store them in the `/images` folder but you will need to map them with a file called `imagemap.csv` which is described below.

You can use a Picasa account to store your images and have the image publishing and mapping taken care of automatically.

### `/userdata/scriptogram/scrpakey.txt`

This should contain the application key for Scriptogram which can be got by adding the "application" mentioned above. It should contain nothing else, no spaces, no line breaks, nothing.

### `/userdata/scriptogram/scrpuser.txt`

This should contain the Scriptogram user ID, which you should find under "Settings" when you login to Scriptogram. It should contain nothing else, no spaces, no line breaks, nothing.

### `/userdata/scriptogram/scrpname.txt`

This contains the actual username which appears in the Scriptogram address, used for the purposes of crosslinking.

## Additional but absent files

You can use a Picasa account to store your images and have the image publishing and mapping taken care of automatically.

### `/userdata/picasa/_client_id.txt`

Obtained by setting up a project in the Google API console.

### `/userdata/picasa/_client_secret.txt`

Obtained by setting up a project in the Google API console.

### `/userdata/picasa/_device_code.txt`

Obtained by setting up a project in the Google API console.

### `/userdata/picasa/imagemap.csv`

This file should contain the filenames of any images in the `/images` folder where it sits, followed by a comma and then the address of where that image is hosted online. Each file and address pair should sit on a separate line. If using Picasa (as the scripts are currently set up to do), this file should be handled automatically.
