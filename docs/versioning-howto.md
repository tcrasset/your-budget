# Code versioning

This file will explain the procedure to follow when updating the version.

As we adhere to the [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) branching model, we will want to create a `release/{NEXT_RELEASE}` branch from the `dev` branch each time we're going to deploy a new release. This branch will later be merged into `master` and `dev`.

The steps are as follows:

1. Make sure the `dev` branch has all the changes that you want to appear in the next version.
2. Decide what version your new release should be. We adhere strictly to [semantic versioning](https://semver.org/)! **Let's say you decide to update to version 1.2.3.**
3. Create the branch `release/1.2.3` from dev using

    ```bash
    git checkout -b release/1.2.3
    ```

4. Run the script [bumpversion.sh](../bumpversion.sh) using

    ```bash
    sh bumpversion.sh [version type]
    ```

    This script takes a single optional argument specifying the version type, one of
      * `--patch`
      * `--minor`
      * `--major`

    to bump the version to the next patch, minor version or major version. See [semantic versioning]([se](https://semver.org/)) for more information.
    >
    For our example, supposing we were on release `1.2.2`, we would need to call

    ```bash
    sh bumpversion.sh --patch
    ```

    to bump the version to `1.2.3`.
    >
    It's purpose is to bump the version number in the `pubspec.yaml` file, create the `version.txt` file used by the Github Actions workflow, create a commit with message `Bump version to 1.2.3` and tag the commit.

5. Merge the `release/1.2.3` back into `master` and `dev` using

   ```bash
   git checkout master
   git merge release/1.2.3 --no-ff
   git checkout dev
   git merge release/1.2.3 --no-ff
   ```

   *Note the `--no-ff` flag. It is important.*
6. You can now safely delete the `release/1.2.3` branch.

   ```bash
   git branch -d release/1.2.3
   ```
