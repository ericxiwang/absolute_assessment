# absolute_assessment
for tech interview

summary of assignment

Delopying steps:
1.create vm on hosting server
You can use Vagrantfile(/vagrant_script) to create a customized server and flask, ssh service and login key are already
Because this is the firest time I tried to use Vagrant, I also provided another solution whichi is based on KVM
so the KVM scripts are all in folder /kvm_scripts

2.Using ansiblb-playbook to deploy nginx,uwsgi and flask-python code
 - I created different roles for nginx, uwsgi and flask
 - The source of nginx is bin file in /nginx/file/nginx-1.13.2.tar.gz
 - the basic flask code will pull from my personal github account:https://github.com/fredriksson/absolute_assessment.git
