# ssh-ca

SSH certificate authentication example in a container.

## Roles

- Local: CA
- Container: Client

## Step 1: Getting ready as a CA

At local

```
ssh-keygen -t ed25519 -C ca@github.com -f ca
```

Upload `ca.pub` to GitHub.com.

## Step 2: Getting ready as a user

At local

```
make build
make run
```

In the container

```
mkdir ~/.ssh
ssh-keygen -t ed25519
```

## Step 3: Sign the public key

At local

```
ssh-keygen \
    -O extension:login@github.com=lowply \
    -s ca \
    -V '+1d' \
    -I lowply \
    ./client/.ssh/id_ed25519.pub
```

To add the `source-address` option:

```
-O source-address=127.0.0.1
```

## Step 4: Test the connection

In the container

```
ssh org-XXXXXXXX@github.com
```

## Further reading

- [SSH certificate authentication for GitHub Enterprise Cloud - The GitHub Blog](https://github.blog/2019-08-14-ssh-certificate-authentication-for-github-enterprise-cloud/)
- [About SSH certificate authorities - GitHub Docs](https://docs.github.com/en/github/setting-up-and-managing-organizations-and-teams/about-ssh-certificate-authorities)
