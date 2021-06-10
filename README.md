# Base Magento Image

PHP 7.3 + Nginx + Redis + MariaDB + Elasticsearch

### To run without installing anything on the container:
```bash
./init --name project-name --repository-url empty
```

### To run installing a new project:
```bash
./init --name project-name --repository-url new --version 2.3.7
```

### To run cloning a git repository:
```bash
./init --name project-name --repository-url repoUrl.git
```

## Issues

**Permission issue when opening up the site for the first time**
If you have permission issues opening up the site, run this inside the root folder (before src) to make sure permissions are correct:

```bash
sudo chown www-data:www-data src/var/ -R
sudo chown www-data:www-data src/pub/ -R
sudo chown www-data:www-data src/generated/ -R
```

This syncs the docker user with the host. There should be no permission problems anylonger.
