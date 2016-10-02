# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Software"})
rescue
end
tipoci = Tipoci.find_by_tipo("Software")
