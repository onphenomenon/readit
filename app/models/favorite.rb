# Favorite model
#
# == License
# Code is owned by Kari
#
# == Info
# * *Category*     ARGON
# * *Package*      API_SERVER
# * *Copyright*    Copyright (c) 2014
# * *License*      Code is owned by

# Favorite model
#
# == Info
# * *Category*    ARGON
# * *Package*     API_SERVER
# * *Copyright*   Copyright (c) 2014
# * *License*     Code is owned by
class Favorite < ActiveRecord::Base
  include Statusable
  belongs_to :user
  belongs_to :post
end
