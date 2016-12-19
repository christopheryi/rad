class Reetcher < ActiveRecord::Base
  has_one :user
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
end
