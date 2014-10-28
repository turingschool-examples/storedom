class Delay
  def self.wait
    return if ENV['FAST'] == "true"

    time = 0.5 / (rand(25)+1)
    sleep time
  end
end
