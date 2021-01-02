# alw-provisioner
my Workspace (Amazon Linux 2) provisioner


## Prerequisite
- Amazon Linux WorkSpaces Initialized
- **Take note of your password**
- Python3 installed (`sudo yum install python3`)
- Ansible installed (`sudo amazon-linux-extras install ansible2`)


## Before Setup Process
1. `git clone https://github.com/ant-in-giant/alw-provisioner.git`
2. `cd /path/to/alw-provisioner`
3. `make dns`
4. `make brew`
5. `make zsh`      # [optional]
6. (Uncomment out `# amazon-linux-extras` part in  roles/packages/tasks/main.yml)  # if necessary


## Usage

- That's all  
  `make`

- Dry run  
  `make test`

- Only packages install/update  
  `make packages`

- etc...
  - `make dot`
  - `make nvm`
  - `make ij`


## References
- https://docs.aws.amazon.com/workspaces/index.html
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/amazon-linux-ami-basics.html#extras-library
- https://github.com/sogaoh/mba-provisioner
- [Amazon Linux WorkSpaces で個別の作業環境を作り込む](https://zenn.dev/sogaoh/scraps/d1cf2e766961e19a1a15)

