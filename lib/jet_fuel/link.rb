module JetFuel
  class Link
    def self.shorten(url)
      length = 1
      #(0..1).map{ ('a'..'z').to_a[rand(26)] }.join
      "jetfuel.herokuapp.com/jf/#{generate_relative_link(10)}"
    end

    def self.generate_relative_link(length)
      x ||= [('a'..'z'),('A'..'Z'),('0'..'9')].map{|i| i.to_a}.flatten
      (0..(length-1)).map{ x[rand(x.length)] }.join
    end
  end
end
