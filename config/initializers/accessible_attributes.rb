# Locks down all attribute assignments by default
# See [Railscast 237](http://railscasts.com/episodes/237-dynamic-attr-accessible)
class ActiveRecord::Base  
  attr_accessible  
  attr_accessor :accessible  
    
  private  
  def mass_assignment_authorizer  
    if accessible == :all  
      self.class.protected_attributes  
    else  
      super + (accessible || [])  
    end  
  end  
end