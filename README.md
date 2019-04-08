# provisioning gitlab server enterprise on an existing host

## hardware requirement

> the gitlab server and its supporting aws resources have been defined in [gitlab-server and its supporting infrastructure build guide](https://scode.greencap.com.au/devops/gitlab-server)

## usage 

* clone this repo to linux jumpbox

```
 ~]$ git clone https://github.com/fen9li/gitlab-server-playbook.git
Cloning into 'gitlab-server-playbook'...
remote: Enumerating objects: 8, done.
remote: Counting objects: 100% (8/8), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 8 (delta 0), reused 5 (delta 0), pack-reused 0
Unpacking objects: 100% (8/8), done.
 ~]$ cd gitlab-server-playbook/
 gitlab-server-playbook]$
```

* configure new gitlab-server ec2 instance in hosts

> get ready the private ip address of the new gitlab-server ec2 instance you have created    
> update the private ip address in /home/ec2-user/gitlab-server-playbook/hosts

```
 gitlab-server-playbook]$ vim hosts
 gitlab-server-playbook]$ cat hosts
[gitlab-server]
173.120.15.102
 gitlab-server-playbook]$ 
```

* run playbook

```
 gitlab-server-playbook]$ ansible-playbook -i hosts site.yml

PLAY [gitlab-server] ****************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************
ok: [173.120.15.102]

TASK [gitlab-server : Include OS-specific variables.] *******************************************************************************
ok: [173.120.15.102]

TASK [gitlab-server : Check if GitLab configuration file already exists.] ***********************************************************
ok: [173.120.15.102]

TASK [gitlab-server : Check if GitLab is already installed.] ************************************************************************
ok: [173.120.15.102]

TASK [gitlab-server : Download GitLab repository installation script.] **************************************************************
skipping: [173.120.15.102]

TASK [gitlab-server : Install GitLab repository.] ***********************************************************************************
skipping: [173.120.15.102]

TASK [gitlab-server : Define the Gitlab package name.] ******************************************************************************
skipping: [173.120.15.102]

TASK [gitlab-server : Install GitLab] ***********************************************************************************************
skipping: [173.120.15.102]

TASK [gitlab-server : Reconfigure GitLab (first run).] ******************************************************************************
ok: [173.120.15.102]

TASK [gitlab-server : Copy GitLab configuration file.] ******************************************************************************
changed: [173.120.15.102]

RUNNING HANDLER [gitlab-server : restart gitlab] ************************************************************************************
changed: [173.120.15.102]

PLAY RECAP **************************************************************************************************************************
173.120.15.102             : ok=7    changed=2    unreachable=0    failed=0

 gitlab-server-playbook]$
```