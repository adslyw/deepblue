module AssetsHelper
  def icon_for(asset)
    case asset.file_name
      when /csv\Z/i then fa_icon("file-text-o")
      when /txt\Z/i then fa_icon("file-text-o")
      when /png\Z/i then fa_icon("picture-o")
      when /jpe?g\Z/i then fa_icon("picture-o")
      when /gif\Z/i then fa_icon("picture-o")
      when /pdf\Z/i then fa_icon("file-pdf-o")
      when /docx?\Z/i then fa_icon("file-word-o")
      when /pptx?\Z/i then fa_icon("file-powerpoint-o")
      when /xlsx?\Z/i then fa_icon("file-excel-o")
      when /zip\Z/i then fa_icon("file-zip-o")
      when /rar\Z/i then fa_icon("file-zip-o")
      when /mp4\Z/i then fa_icon("film")
      when /flv\Z/i then fa_icon("film")
      when /mp3\Z/i then fa_icon("music")
      when /ogg\Z/i then fa_icon("music")
    end
  end
end
