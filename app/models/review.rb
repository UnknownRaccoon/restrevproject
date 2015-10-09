class Review < ActiveRecord::Base
    validates :name, presence: true, length: {maximum: 50}
    validates :address, presence: true, length: {in: 5..100}
    validates :review, presence: true, length: {minimum: 50}
    validates :mark1, presence: true
    validates :mark2, presence: true
    validates :mark3, presence: true
    validate :marker_set
    def marker_set
        errors.add(:" ", " Требуется укзать местоположение заведения") if not x.present?
    end
    def avgrate
        mark1 * 0.4 + mark2 * 0.3 + mark3 * 0.3
    end
end