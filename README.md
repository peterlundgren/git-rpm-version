git-rpm-version
===============

Compute the rpm version and release based on the most recent tag matching v*

    Tree                         RPM Name
    ---------------------------  --------------------------
    <dirty working tree>         foo-2.0.0-1.dirty.rpm
    * e553fd9 (tag: v2.0.0)      foo-2.0.0-1.rpm
    * 9dbedc2 (tag: v2.0.0-rc1)  foo-2.0.0-0.rc1.rpm
    * 0453d18                    foo-1.0.1-1.2.g0453d18.rpm
    *   f8cfa92                  foo-1.0.1-1.1.gf8cfa92.rpm
    |\
    | * 33dcc6f (tag: v1.0.1)    foo-1.0.1-1.rpm
    * | 1afd2e4                  foo-1.0.0-1.1.g1afd2e4.rpm
    |/
    * fb631ec (tag: v1.0.0)      foo-1.0.0-1.rpm
    * 205005c                    foo-0-g205005c.rpm

If the code being built does not exactly match a release tag, the rpm release
will contain additional build information to help identify what source it came
from.

    foo-1.2.3-1.4.g2f3cc98.dirty
    ^   ^     ^ ^ ^^       ^
    |   |     | | ||       If the working tree is dirty
    |   |     | | |Hash of current commit if different than the tag
    |   |     | | Indicates that the following is a Git hash
    |   |     | Number of additional commits ahead of the tag
    |   |     0 if release candidate, 1 otherwise
    |   Most recent tagged release
    Package name

Release tags must be annotated tags and be in the form vX.Y.Z or vX.Y.Z-rcW
where W, X, Y, and Z are integers. vX.Y.Z is assumed to be newer than
vX.Y.Z-rcW. Otherwise, X, Y, Z, and W are compared one by one. If the numbers
are different, the larger number is considered newer. If the numbers are equal,
the next number is compared.

This algorithm follows the [Fedora convention][1] for mapping software releases
to rpm version and release numbers.

  [1]: https://docs.fedoraproject.org/en-US/packaging-guidelines/Versioning/
