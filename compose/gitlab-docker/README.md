# Gitlab Installation Using docker-compose.yaml

1. Open terminal, and go to this docker-compose.yaml directory
2. Run `docker-compose up` (ignore errors about the docker runner config.toml file, it'll be configured when we register the runner)
3. Gitlab will be available with http://gitlab.home custom host (you can change it in the docker compose file), but you should add `gitlab.home` in your host file `/etc/hosts` for 127.0.0.1 local ip. Open the `/etc/hosts` file using `sudo vi /etc/hosts` insert a new `line 127.0.0.1    gitlab.home` and save it.
4. Wait for 2-3 minutes (installing the gitlab containers) and call gitlab.home in the browser.
5. Use this command to find the root password `docker exec -it gitlab-web grep 'Password:' /etc/gitlab/initial_root_password`, the username is "root". BTW the gitlab container name is `gitlab-web`.

# Registering a New Gitlab Runner on Docker

1. Go to the terminal and run the following command:
    - `docker exec -it gitlab-runner gitlab-runner register --url "http://gitlab-web" --clone-url "http://gitlab-web"`
 
2. It asks for the following information:
    - Enter the GitLab instance URL: `http://gitlab-web`
    - Enter the registration token: enter the token copied from [Admin Area > Runners admin page](http://gitlab.home/admin/runners)
    - Enter a description for the runner: `shared-runner-1`
    - Enter tags for the runner: leave it blank, press enter
    - Enter an executor: `docker`
    - Enter the default Docker image: `node:16.3.0-alpine`

3. it'll create /gitlab-runner/config.toml file in the gitlab home directory. We've set it in the .env file of this project. The default value of `$GITLAB_HOME` is `~/Desktop/GITLAB2`, so the /gitlab-runner/config.toml file is in `GITLAB2` folder on your desktop. 
4. Use "sudo vi" and open the runner configuration file `sudo vi ~/Desktop/GITLAB2/gitlab-runner/config.toml` file.
5. Insert this line at the end of this file: `network_mode = "gitlab-network"` ,then save and exit (`:x`).
6. The runner should be available in [Admin Area > Runners admin page](http://gitlab.home/admin/runners)