class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def recieved_one?(item_name)
        if self.freebies.where(item_name: item_name).count > 0
            return true
        else
            return false
        end
    end

    def give_away(dev, freebie)
        if self.id == freebie.dev_id
            freebie.dev = dev
            freebie.save
            "You gave away #{freebie.item_name} to #{dev.name}."
        else
            "You can't give away a freebie that belongs to someone else."
        end
    end
end
