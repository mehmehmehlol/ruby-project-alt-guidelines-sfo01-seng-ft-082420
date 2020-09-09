class SwimMeet < ActiveRecord::Base
    belongs_to :coach
    belongs_to :student
end
