# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Mapeamento"})
rescue
end
tipoci = Tipoci.find_by_tipo("Mapeamento")
