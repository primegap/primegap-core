class Customer < ActiveRecord::Base
  validates_presence_of :full_name

  before_save :split_full_name

  belongs_to :company

  private

  def split_full_name
    splitted_name = full_name.split(' ')
    if splitted_name.length == 1
      self.last_name = splitted_name[0]
    else
      self.first_name = splitted_name[0..splitted_name.length - 2].join(' ')
      self.last_name  = splitted_name[splitted_name.length - 1]
    end
  end
end
