require "hex_to_rgba/version"

module HexToRgba
  class Converter
    attr_accessor :color, :opacity

    def self.convert color, opacity
      if (/([a-fA-F]|[0-9]){3,6}/ =~ color).nil?
        'Wrong color format'
      else
        if color.length == 3
          red = (color[0]*2).to_i 16
          green = (color[1]*2).to_i 16
          blue = (color[2]*2).to_i 16
        elsif color.length == 6
          red = color[0..1].to_i 16
          green = color[3..4].to_i 16
          blue = color[5..6].to_i 16
        else
          'Wrong color format'
        end
        "rgba(#{red}, #{green}, #{blue}, #{opacity})"
      end
    end
  end
end
