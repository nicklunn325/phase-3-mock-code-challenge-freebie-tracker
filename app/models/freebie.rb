class Freebie < ActiveRecord::Base
    belongs_to :dev
    belongs_to :company


    def dev=(dev)
        self.dev_id = dev.id
        self.save
    end

    def print_details
        "#{self.dev.name} owns a #{self.item_name} from #{self.company.name}"
    end
end
