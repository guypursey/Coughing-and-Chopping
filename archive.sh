## Find or create `date.txt`.	

	if [ ! -f ./drafts/$1/date.txt ]
		then
			echo $(date '+%F %H:%M') > ./drafts/$1/date.txt
	fi

## Get date from `date.txt` and prepare for use in file name.

	datetime=$(<./drafts/$1/date.txt)
	datetime=${datetime:0:16}
	dateprfx=${file:0:4}${file:5:2}${file:8:2}${file:11:2}${file:14:2}

## Clean up file name.

	cleanfilename=$(echo $1 | tr '_ ' \-)
	newdirname=$(echo "$dateprfx"-"$cleanfilename")

## Move whole folder from `drafts` to `archives`, with new name.

	mv ./drafts/$1 ./archives/$newdirname

## Rename main file via Git command.

	cd ./archives/$newdirname
	git mv $1.md $newdirname.md
	git commit -qm "Renamed main file on publish."

## Make a copy of the post in `posted` folder.

	cp $newdirname.md ../../posted

## Return the new name of the folder/file.

	echo $newdirname
