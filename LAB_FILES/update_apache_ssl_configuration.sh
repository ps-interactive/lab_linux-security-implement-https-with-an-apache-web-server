# Make sure the hostname is set to ubuntu
if (hostnamectl | grep -q "Static hostname: ubuntu");
then
  echo "Hostname is set to ubuntu"
else
  echo
  echo "Make sure the hostname is set to 'ubuntu':";
  echo "Make sure the hostname is set to 'ubuntu':";
  echo
  echo "sudo hostnamectl set-hostname ubuntu"
  echo
  return 1
fi

# copy the updated default SSL site configuration into place
cp -v /home/pslearner/lab/LAB_FILES/default-ssl.conf /etc/apache2/sites-available/

# enable the default SSL site 
a2ensite default-ssl && \

# test the configuration and reload if all is well
# end by checking the apache status
apachectl configtest && systemctl reload apache2 && systemctl status apache2
