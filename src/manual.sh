#!/encs/bin/tcsh

##
## Job Scheduler options 
##

#SBATCH --job-name=speed-manual ## Give the job a name
#SBATCH --mail-type=ALL         ## Receive all email type notifications
#SBATCH --mail-user=$USER@encs.concordia.ca
#SBATCH --chdir=./              ## Use currect directory as working directory
#SBATCH --cpus-per-task=2       ## Request 2 cpus
#SBATCH --mem=1G                ## Assign memory per node 

##
## Job to run
##

# timestamp
echo "$0 : about to run Speed manual generation job on Speed :-)"
date

# Pull speed-hpc sources latest commit only to avoid
# downloading all the history. For fun time the longer
# running commands.
time git clone --depth 1 --branch master https://github.com/NAG-DevOps/speed-hpc.git

# We need to be in the doc directory
cd speed-hpc/doc
pwd

# Generate PDF manual
time make

# Generate the HTML manual
time make html

# Report generated files
ls -al *.pdf web/*
git status

echo "$0 : Done!"
date

# EOF
