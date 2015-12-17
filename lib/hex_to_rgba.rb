require "hex_to_rgba/version"

module HexToRgba
  class Converter
    def self.convert color, opacity
      if color.to_s.include? '#'
        hexadecimal_color = color.delete '#'
      else
        hexadecimal_color = color
      end

      if (/([a-fA-F]|[0-9]){3,6}/ =~ color).nil?
        'Wrong color format'
      else
        if hexadecimal_color.length == 3
          red = (hexadecimal_color[0]*2).to_i 16
          green = (hexadecimal_color[1]*2).to_i 16
          blue = (hexadecimal_color[2]*2).to_i 16
        elsif hexadecimal_color.length == 6
          red = hexadecimal_color[0..1].to_i 16
          green = hexadecimal_color[3..4].to_i 16
          blue = hexadecimal_color[5..6].to_i 16
        else
          'Wrong color format'
        end
        "rgba(#{red}, #{green}, #{blue}, #{opacity})"
      end
    end
  end
end
