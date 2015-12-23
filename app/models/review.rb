class Review < ActiveRecord::Base
    has_attachments :photos, maximum: 15
    validates :name, presence: true, length: {maximum: 50}
    validates :address, presence: true, length: {in: 5..100}
    validates :review, presence: true
    validates :keywords, presence: true
    validate :custom_validation
    include PgSearch
    pg_search_scope :search_in_text, :against => [:name,:address,:review,:keywords]

    def custom_validation
        errors.add(:" ", " Требуется укзать местоположение заведения") if not x.present?
        errors.add(:" ", " Требуется выставить все оценки") if not mark1.present? or not mark2.present? or not mark3.present?
    end
    def avgrate
        mark1 * 0.4 + mark2 * 0.3 + mark3 * 0.3
    end


end
