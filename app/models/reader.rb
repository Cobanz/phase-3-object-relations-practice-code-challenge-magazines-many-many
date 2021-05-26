class Reader < ActiveRecord::Base
    has_many :subscription
    has_many :magazine, through: :subscription

    def subscribe(magazine, price)
        Subscription.create(magazine: magazine, price: price, reader: self)
    end

    def total_subcription_price
        total = self.subscription.map do |sub|
            sub.price
        end
    total.sum
    end

    def cancel_subscription(magazine)
        if self.magazine.inclue?(magazine)
           sub = self.subscription.where("magazine_id = #{magazine.id}").first
           sub.destory
    end
  
end