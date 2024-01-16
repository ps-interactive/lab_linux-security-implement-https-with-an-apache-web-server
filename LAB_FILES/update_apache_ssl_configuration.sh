# Make sure the hostname is set to ubuntu
if (hostnamectl | grep -qE "^Static hostname: ubuntu$");
then
  echo "Hostname is set to ubuntu"
else
  echo
  echo "Current hostname is $(hostnamectl | grep 'Static hostname' | cut -d: -f2)"
  echo
  echo "Make sure the hostname is set to 'ubuntu':";
  echo
  echo "sudo hostnamectl set-hostname ubuntu"
  echo
  return 1
fi

# copy the updated default SSL site configuration into place
sudo cp -v /home/pslearner/lab/LAB_FILES/default-ssl.conf /etc/apache2/sites-available/

# enable the default SSL site 
sudo a2ensite default-ssl && \

# test the configuration
sudo apachectl configtest && \

# reload if all is well
sudo systemctl reload apache2 && \

# if reload is good, check the status
sudo systemctl status apache2
