class Hackerino < ActiveRecord::Base
  has_many :comments
  default_scope -> { order('vote DESC') }
end
