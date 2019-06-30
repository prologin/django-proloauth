echo "GITHUB_TOKEN: rêve"
echo "TRAVIS_REPO_SLUG: $TRAVIS_REPO_SLUG"
echo "TRAVIS_PULL_REQUEST: $TRAVIS_PULL_REQUEST"

if [ "$TRAVIS_PULL_REQUEST" != "false" ] ; then
    COMMENT=`cat utils/message_unformated.md|sed ':a;N;$!ba;s/\n/\\\\n/g'`
    curl -H "Authorization: token $GITHUB_TOKEN" \
         -X POST \
         -d "{\"body\": \"$COMMENT\"}" \
         "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/issues/${TRAVIS_PULL_REQUEST}/comments"
fi
