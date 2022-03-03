# github-transfer-script

## Preparation

0. Optionally create a new organization to transfer your repositories to
1. Create A GitHub Personal Access Token (Settings > Developer Settings > Personal Access Tokens)
2. Clean the repo information so that just the name remains (each name is followed by whitespace, and size/fork info): `%s/\s.*$//g`

## Usage

0. Clone this repository and open up a terminal in the root directory
1. Install `bash`, `curl`, & `jq` and any dependencies if you don't already have them installed
2. pull all repos to `repos.txt`: `bash get_repos.sh repos.txt`
3. confirm `repos.txt` content
4. Set your GitHub Personal Access Token (or password if you insist) as an environment variable named `GITHUB_SECRET`
5. Execute the program with your username (OWNER) and the name of the new owner (NEWOWNER): `bash bulk_transfer_repos.sh OWNER NEWOWNER`

## Reference project

- [github-api-bulk-transfer](<https://github.com/jdbean/github-api-bulk-transfer>)
- [Github List All Repositories in Organization or Personal using REST API](<https://www.middlewareinventory.com/blog/github-list-all-repositories-using-rest-api/>)

## License

All work in this repository is made available under the terms of the AGPLv3 License, a copy of which is provided in the file called `License`. Copyright J.D. Bean 2019