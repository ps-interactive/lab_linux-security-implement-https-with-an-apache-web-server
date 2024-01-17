# Make sure the hostname is set to ubuntu
if (hostnamectl | grep -qE "Static hostname: ubuntu$");
then
  echo
else
  sudo hostnamectl set-hostname ubuntu
fi

# copy the updated default SSL site configuration into place
sudo cp -v /home/pslearner/lab/LAB_FILES/default-ssl.conf /etc/apache2/sites-available/

# enable the SSL module
sudo a2enmod ssl && \

# enable the default SSL site 
sudo a2ensite default-ssl && \

# test the configuration
sudo apachectl configtest
