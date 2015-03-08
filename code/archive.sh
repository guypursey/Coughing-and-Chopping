## Find source folder where we are.

	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

## Find or create `date.txt`.	

	if [ ! -f "$DIR"/../content/drafts/$1/date.txt ]
		then
			echo $(date '+%F %H:%M') > "$DIR"/../content/drafts/$1/date.txt
	fi

## Get date from `date.txt` and prepare for use in file name.

	datetime=$(<"$DIR"/../content/drafts/$1/date.txt)
	datetime=${datetime:0:16}
	dateprfx=${datetime:0:4}${datetime:5:2}${datetime:8:2}${datetime:11:2}${datetime:14:2}

## Clean up file name.

	cleanfilename=$(echo $1 | tr '_ ' \-)
	newdirname=$(echo "$dateprfx"\-"$cleanfilename")

## Move whole folder from `drafts` to `archives`, with new name.

	mv "$DIR"/../content/drafts/$1 "$DIR"/../content/archives/$newdirname

## Rename main file via Git command.

	cd "$DIR"/../content/archives/$newdirname
	git mv $1.md $newdirname.md
	git commit -qm "Renamed main file on publish."

## Make a copy of the post in `posted` folder.

	cp $newdirname.md ../../posted

## Return the new name of the folder/file.

	echo $newdirname
