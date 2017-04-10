# npm publish with goodies
# prerequisites:
# `npm install -g trash conventional-recommended-bump conventional-changelog conventional-github-releaser conventional-commits-detector json`
# `np` with optional argument `patch`/`minor`/`major`/`<version>`
# defaults to conventional-recommended-bump
# and optional argument preset `angular`/ `jquery` ...
# defaults to conventional-commits-detector
# @see https://gist.github.com/stevemao/280ef22ee861323993a0
np() {
    # travis status --no-interactive &&
    # trash node_modules &>/dev/null;
    # git pull --rebase &&
    # npm install &&
    # npm test &&
    # cp package.json _package.json &&
    preset=`conventional-commits-detector` &&
    echo $preset &&
    bump=`conventional-recommended-bump -p $preset` &&
    echo ${1:-$bump} &&
    # npm --no-git-tag-version version ${1:-$bump} &>/dev/null &&
    # podspec-bump ${1:-$bump} -w &&
    conventional-changelog -i CHANGELOG.md -s -p ${2:-$preset} &&
    git add CHANGELOG.md &&
    # version=`cat package.json | json version` &&
    version="`podspec-bump --dump-version`" &&
    echo "v$version" &&
    git commit -m "docs(CHANGELOG): v$version" &&
    # mv -f _package.json package.json &&
    # npm version ${1:-$bump} -m "chore(release): %s" &&
    current_branch="`git rev-parse --abbrev-ref HEAD`" &&
    echo $current_branch &&
    git push origin $current_branch &&
    git tag -a v$version -m "v$version"
    # git push --follow-tags &&
    git push origin --tags &&
    conventional-github-releaser -p ${2:-$preset} &&
    # npm publish
}

# apm publish with goodies
ap() {
    travis status --no-interactive &&
    trash node_modules &>/dev/null;
    git pull --rebase &&
    npm install &&
    apm install &&
    npm test && # checking coding styles or non atom related tests maybe
    apm test &&
    cp package.json _package.json &&
    preset=`conventional-commits-detector` &&
    echo $preset &&
    bump=`conventional-recommended-bump -p angular` &&
    echo ${1:-$bump} &&
    npm --no-git-tag-version version ${1:-$bump} &>/dev/null &&
    conventional-changelog -i CHANGELOG.md -s -p ${2:-$preset} &&
    git add CHANGELOG.md &&
    version=`cat package.json | json version` &&
    git commit -m":memo: CHANGELOG for $version" &&
    mv -f _package.json package.json &&
    apm publish ${1:-$bump} &&
    git push --follow-tags &&
    conventional-github-releaser -p ${2:-$preset}
}
