class Item < ApplicationRecord
  belongs_to :author
  belongs_to :bill
end
