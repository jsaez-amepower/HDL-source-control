To initialize the repo with a list of HDL, run AddHDLToBranch.sh (make sure to modify the directories).
If you'd like to include components instead of HDL, run AddComponentToBranch.sh

How to include the HDLs in your project:
1. Clone the repo somewhere in the project folder. (e.g. MCI_FPGA\hdl)
2. Checkout the BashScripts branch
3. run gitworktreecommand.sh

Each HDL will have it's own folder with it's own git history; they are stored as different branches of this repo.

To update all the HDLs with the latest version, run PullAll.sh

To upload your changed version to the repo, run PushAll.sh
