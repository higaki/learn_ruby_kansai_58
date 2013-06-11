class Person
  def initialize name, born
    @name, @born = name, born
  end

  def age
    (yyyymmdd(Time.now).to_i - yyyymmdd(@born).to_i) / 1_00_00
  end

  def yyyymmdd time
    time.strftime '%Y%m%d'
  end
end
