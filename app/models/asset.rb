class Asset < ActiveRecord::Base
  belongs_to :user

  @file_names_white_list = [
    /jpe?g\Z/i,
    /png\Z/i,
    /gif\Z/i,
    /csv\Z/i,
    /txt\Z/i,
    /pdf\Z/i,
    /docx?\Z/i,
    /pptx?\Z/i,
    /xlsx?\Z/i,
    /zip\Z/i,
    /rar\Z/i,
    /mp4\Z/i,
    /flv\Z/i,
    /mp3\Z/i,
    /ogg\Z/i
  ]
  @file_types_white_list = [
    'text/plain',
    'text/csv',
    'image/png',
    'image/gif',
    'image/jpg',
    'image/jpeg',
    'application/pdf',
    'application/msword',
    'application/vnd.ms-word',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/msexcel',
    'application/vnd.ms-excel',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'application/vnd.ms-powerpoint',
    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'application/xml',
    'video/mp4',
    'video/ogg',
    'video/x-flv',
    'audio/mp4',
    'audio/mpeg',
    'audio/ogg'
  ]

  has_attached_file :attachment,
    :url => '/assets/get/:id',
    :path => "#{Rails.root}/uploads/assets/:id/:basename.:extension"
  validates_attachment :attachment,
    :presence => true,
    #:content_type => {:content_type => @file_types_white_list},
    :size => {:in => 0..50.megabytes}
  validates_attachment_file_name :attachment, :matches => @file_names_white_list
  do_not_validate_attachment_file_type :attachment
  def file_name
    attachment_file_name
  end
  def file_size
    attachment_file_size
  end
end
