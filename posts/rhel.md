Setup EPEL repository

    yum install epel-release  
    yum repolist  # verify repo has been added
    
Search packages in available repos

    yum list "*syslog-ng*"
