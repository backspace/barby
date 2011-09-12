require 'barby/barcode'

module Barby


  #Codabar barcodes are used in many libraries.
  class Codabar < Barcode1D

    ENCODINGS = {
      "0" => "10101000110",
      "1" => "10101100010",
      "2" => "10100010110",
      "3" => "11000101010",
      "4" => "10110100010",
      "5" => "11010100010",
      "6" => "10001010110",
      "7" => "10001011010",
      "8" => "10001101010",
      "9" => "11010001010",
      "-" => "10100011010",
      "$" => "10110001010",
      ":" => "11010110110",
      "/" => "11011010110",
      "." => "11011011010",
      "+" => "10110110110",
      "A" => "1011000100010",
      "B" => "1000100010110",
      "C" => "1010001000110",
      "D" => "1010001100010"
    }

    START = ENCODINGS["A"]
    STOP = ENCODINGS["A"]

    attr_accessor :data

    def initialize(data)
      self.data = data
    end


    def characters
      data.split(//)
    end

    def encoding
      start_encoding + characters.map{|c| ENCODINGS[c]}.join("") + stop_encoding
    end

    def start_encoding
      START
    end

    def stop_encoding
      STOP
    end

    # This is likely not universal, just adding for interface parity.
    def valid?
      data.length == 14
    end
  end
end