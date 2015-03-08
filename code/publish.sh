## Find source folder where we are.

	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

## Make folder definitive by moving out of `drafts` and into `archive`.

	pieceref=$("$DIR"/../content/archive.sh $1)

## Use reference for relevant piece to push out to Scriptogram.

	"$DIR"/scriptogram/autoscrp.sh $pieceref
