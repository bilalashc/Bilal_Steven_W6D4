require 'action_view'

class Cat < ApplicationRecord
include ActionView::Helpers::DateHelper

    CAT_COLORS = ["grey", "white", "black", "maroon"]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :sex, inclusion: {in: %w(M F), message: "Sorry, %{value} is not a valid gender"}
    validates :color, inclusion: {in: CAT_COLORS, message: "Sorry,%{value} is not a valid color"}
    validate :birth_date_cannot_be_in_future

    def birth_date_cannot_be_in_future
        if  birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "Sorry, the birth date can't be in the future")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end



end