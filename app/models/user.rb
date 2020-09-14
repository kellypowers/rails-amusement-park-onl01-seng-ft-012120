class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    validates :name, presence: true
    #validates :password, presence: true
    # validates :happiness, presence: true, numericality: {only_integer: true}, inclusion: {:in => (1..5)}
    # validates :nausea, presence: true, numericality: {only_integer: true}, inclusion: {:in => (1..5)}
    # validates :tickets, presence: true, numericality: {only_integer: true}


    # def mood 
    #     if self.happiness.to_i < self.nausea.to_i
    #         "sad"
    #     else 
    #         "happy"
    #     end
    # end

# #     def admin?


# # end


    def mood
        unless admin
        happiness > nausea ? "happy" : "sad"
        end
     end
# class User < ActiveRecord::Base
#     has_secure_password
#     has_many :rides
#     has_many :attractions, :through => :rides
  
#     def mood
#       unless admin
#         happiness > nausea ? "happy" : "sad"
#       end
#     end
#   end

end
