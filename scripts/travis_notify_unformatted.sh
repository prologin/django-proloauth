COMMENT=$(sed ':a;N;$!ba;s/\n/\\\\n/g' <<EOF
Your branch contains non-formatted code.

Please reformat your code by running `black .` at the root of the project. You
may consider automating this process by installing [this git hook](https://gist.github.com/mrasband/fa8c07a1c63d685f4796c439089ef3ab).
EOF
)

if [ "$TRAVIS_PULL_REQUEST" != "false" ] ; then
    curl -H "Authorization: token $GITHUB_TOKEN" \
         -X POST \
         -d "{\"body\": \"$COMMENT\"}" \
         "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"
fi
