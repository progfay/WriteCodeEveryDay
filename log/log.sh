#! /bin/bash

set -eu

today="$(date '+%Y-%m-%d')"
mkdir -p ${today}

npm exec -y @progfay/github-streaks -- @progfay > "${today}/github-streaks.txt"
sed -E "s/"$'\E'"\[([0-9]{1,2}(;[0-9]{1,2})*)?m//g" "${today}/github-streaks.txt" > "${today}/github-streaks-mono.txt"
npm exec -y carbon-now-cli -- --open "${today}/github-streaks-mono.txt"
open "https://github-contributions.vercel.app/"

echo "Save images as log/${today}/carbon.png and log/${today}/github-contributions.png!"
