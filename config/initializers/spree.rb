# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
end

Spree.user_class = "Spree::User"
Devise.secret_key = "fd7f4f4a57a3ea90646a95b62b53f967b814468e36b557540e92707e6a7a923ffa4a96d45a76d89a598ceff84dba377bf301"
