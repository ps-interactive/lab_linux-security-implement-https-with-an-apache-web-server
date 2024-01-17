# Make sure the hostname is set to ubuntu
if (hostnamectl | grep -qE "Static hostname: ubuntu$");
then
  echo
else
  sudo hostnamectl set-hostname ubuntu
fi

# copy the updated default site configuration into place
sudo cp -v /home/pslearner/lab/LAB_FILES/000-default.conf /etc/apache2/sites-available/

# test the configuration
sudo apachectl configtest
