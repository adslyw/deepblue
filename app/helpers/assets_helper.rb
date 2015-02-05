module AssetsHelper
  def icon_for(asset)
    case asset.file_name
    when /csv\Z/i then fa_icon("file-text-o fw")
      when /txt\Z/i then fa_icon("file-text-o fw")
      when /png\Z/i then fa_icon("picture-o fw")
      when /jpe?g\Z/i then fa_icon("picture-o fw")
      when /gif\Z/i then fa_icon("picture-o fw")
      when /pdf\Z/i then fa_icon("file-pdf-o fw")
      when /docx?\Z/i then fa_icon("file-word-o fw")
      when /pptx?\Z/i then fa_icon("file-powerpoint-o fw")
      when /xlsx?\Z/i then fa_icon("file-excel-o fw")
      when /zip\Z/i then fa_icon("file-zip-o fw")
      when /rar\Z/i then fa_icon("file-zip-o fw")
      when /mp4\Z/i then fa_icon("film fw")
      when /flv\Z/i then fa_icon("film fw")
      when /mp3\Z/i then fa_icon("music fw")
      when /ogg\Z/i then fa_icon("music fw")
    end
  end
end
