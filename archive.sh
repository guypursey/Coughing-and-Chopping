## Find or create `date.txt`.	

	if [ -f ./drafts/$1/date.txt ]
		then
			datetime=$(<./drafts/$1/date.txt)
		else
			datetime=$(date '+%FT%H-%M')
			echo $datetime > ./drafts/$1/date.txt
	fi

## Clean up file name.

	cleanfilename=$(echo $1 | tr '_ ' \-)
	newdirname=$(echo "$datetime"_"$cleanfilename")

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
