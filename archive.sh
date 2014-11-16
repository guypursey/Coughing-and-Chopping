## Clean up file name.

	cleanfilename=$(echo $1 | tr '_ ' \-)
	newdirname=$(echo $(date '+%FT%H-%M')_$cleanfilename)

## Move whole folder from `drafts` to `archives`, with new name.

	mv ./drafts/$1 ./archives/$newdirname

## Rename main file via Git command.

	cd ./archives/$newdirname
	git mv $1.md $newdirname.md
	git commit -m "Renamed main file on publish."

## Make a copy of the post in `posted` folder.

    cp $newdirname.md ../../posted