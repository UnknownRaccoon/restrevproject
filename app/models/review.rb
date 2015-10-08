class Review < ActiveRecord::Base
    def avgrate
        mark1 * 0.4 + mark2 * 0.3 + mark3 * 0.3
    end
end
