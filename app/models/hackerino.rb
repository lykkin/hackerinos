class Hackerino < ActiveRecord::Base

  validates :title, presence: true

  #seems regexes are pretty bad at url validation!
  VALID_URL_REGEX=/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)/
  validates :url, presence: true, format: { with: VALID_URL_REGEX}

  before_save { self.url = url.downcase }

  has_many :comments
  default_scope -> { order('vote DESC') }

end
