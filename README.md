# Provision a containerized taurus.org

```bash 
export URI_REPO_GIT=https://github.com/Jean-Baptiste-Lasselle/provision-taurus.git
mkdir some-taurus/
cd some-taurus/
git clone "$URI_REPO_GIT" .
chmod +x ./operations.sh
./operations.sh
```

