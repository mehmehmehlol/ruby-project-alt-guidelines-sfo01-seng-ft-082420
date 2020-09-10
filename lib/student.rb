class Student < ActiveRecord::Base
    has_many :swim_meets
    has_many :coaches, through: :swim_meets

end
