# -Hacktoberfest2023
#Hacktoberfest2023

Contribute to Opensource

Contribution Rules📚:
You are allowed to make pull requests. We just merge it ;)
Do NOT add any build steps e.g npm install (we want to keep this a simple static site)
Do NOT remove other content.
Styling/code can be pretty, ugly or stupid, big or small as long as it works
Try to keep pull requests small to minimize merge conflicts



Getting Started 🤩🤗:
Fork this repo (button on top)
Clone on your local machine
git clone https://github.com/janakbist/-Hacktoberfest2023.git
Navigate to project directory.
cd Hacktoberfest2022
Create a new Branch
git checkout -b my-new-branch
git add .
Commit your changes.
git commit -m "Relevant message"
Then push
git push origin my-new-branch
Create a new pull request from your forked repository


Avoid Conflicts {Syncing your fork}
An easy way to avoid conflicts is to add an 'upstream' for your git repo, as other PR's may be merged while you're working on your branch/fork.


git remote add upstream https://github.com/janakbist/-Hacktoberfest2023.git
You can verify that the new remote has been added by typing


git remote -v
To pull any new changes from your parent repo simply run


git merge upstream/master
