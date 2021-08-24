#!/bin/sh
echo "Copying api-definitions changelog"
echo "Running update changelog script"
changeLog=$(node scripts/update-api-definitions.js)
changeLog="${changeLog//'%'/'%25'}"
changeLog="${changeLog//$'\n'/'%0A'}"
changeLog="${changeLog//$'\r'/'%0D'}"
echo "CHANGE_LOG=$changeLog" >> $GITHUB_ENV
rm -rf OAI_CHANGES.md
echo "Git configurations"
git config --global user.email "lakshmiravali.rimmalapudi@gmail.com"
git config --global user.name "lakshmiravali"
git add .
commitMessage='fix: Updated api definitions of changelog in CHANGES.md of cli'
echo "Commit message:$commitMessage"
git commit -m "$commitMessage"
git push origin test_branch
