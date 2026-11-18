#STEP-1: Installing Git and Maven
yum install git maven -y

#STEP-2: Repo Information (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo \https://pkg.jenkins.io/rpm-stable/jenkins.repo

#STEP-3: Download Java 21 and Jenkins
sudo yum install -y java-25-amazon-corretto-devel maven
yum install jenkins -y
sudo mount -o remount,size=2G /tmp
#STEP-4: Start and check the JENKINS Status
systemctl start jenkins.service
systemctl status jenkins.service

#STEP-5: Auto-Start Jenkins
systemctl enable jenkins.service
