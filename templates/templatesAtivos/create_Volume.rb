# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Volume"})
rescue
end
tipoci = Tipoci.find_by_tipo("Volume")
