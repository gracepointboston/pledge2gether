class Pledgegroup < ApplicationRecord
    serialize :admins, Array
    serialize :pledges, Array

    validates :budget, numericality: { only_integer: true }
end
