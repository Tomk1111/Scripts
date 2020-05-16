if [[ $# -gt 0 ]]; then

	# USER GITHUB DETAILS
	username="<name>"

	# auth requires token inside double quotes, auth_id is the same token without quotes
	auth="<auth_token>"
	auth_id=<auth_token>;


	# WORKSPACE VARIABLE POINTS TO LOCAL DIRECTORY TO STORE PROJECTS
	workspace="<work_directory>"
	github_url="https://api.github.com/user/repos"
	repo=$1
	github_repo_location="https://github.com/$username/$repo.git"
	echo "********** Preparing repo: $repo **********"
	cd $workspace
	mkdir $repo
	cd $repo
	curl -H "Authorization: token $auth" $github_url -d "{\"name\":\"$repo\",\"private\":\"true\"}"
	git init
	git remote add origin $github_repo_location
	touch README.md
	echo "# ${repo}" >> README.md
	portfolioCheck=false;

	# This script was developed to shorten the process of setting up a flutter project
	# Parameter checking can be adapted for other purposes
	if [[ $# -eq 2 ]]; then
		if [[ $2 == '-f' ]]; then
			flutter create $repo
		fi
		if [[ $2 == '-p' ]]; then
			portfolio=true;
		fi
	fi
	if [[ $# -eq 3 ]]; then
		if [[ $2 == '-f' ]]; then
			flutter create $repo
		fi
		if [[ $2 == '-p' ]]; then
			portfolio=true;
		fi
	fi
	git add .
	git commit -m "First commit"
	git push -u origin master

	# Used for tagging personal projects that I want to display in my portfolio
	# Can be adapted for other topics
	if [[ "$portfolio" = true ]]; then
		curl -L -X PUT https://api.github.com/repos/$username/$repo/topics \
		-H 'Accept: application/vnd.github.mercy-preview+json' \
		-H "Authorization: Bearer $auth_id" \
		-H 'Content-Type: text/plain' \
		--data-raw '{
		"names": [
			"portfolio"
		]
		}'
	fi

	# Open the directory containing the new git repo in vscode
	code .
fi
