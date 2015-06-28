class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  before_destroy :display_forbidden

  def display_forbidden
    puts "display self status"
    puts self.status
    # status = true
    # if self.security_users.count > 0
    #   self.errors[:deletion_status] = 'Cannot delete security role with active users in it.'
    #   status = false
    # else
    #   self.errors[:deletion_status] = 'OK.'
    # end
    # status
  end

end
