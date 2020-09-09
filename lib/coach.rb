class Coach < ActiveRecord::Base
    has_many :swim_meets
    has_many :students, through: :swim_meets
end