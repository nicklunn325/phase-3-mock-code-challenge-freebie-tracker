class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def recieved_one?(item_name)
        items = self.freebies.where(item_name: item_name)
        if items.count > 0
            true
        else
            false
        end
        # item = self.freebies.find do |freebie|
        #     freebie.item_name == item_name
        # end
        # if item
        #     true
        # else
        #     false
        # end
    end

    def give_away(dev, freebie)
            # freebie.dev == self
            # check to see if freebie belongs to self(dev trying to give freebie away)
            # if the freebie does belong to self, reassign dev to the instance of dev that was passed as an argument
            # save to database
        if freebie.dev_id == self.id
            freebie.dev_id = dev.id
            freebie.save
        else
            "You don't own that freebie"
        end
    end
end
