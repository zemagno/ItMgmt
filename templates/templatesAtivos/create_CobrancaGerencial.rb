# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => "Cobranca Gerencial"})
rescue
end
tipoci = Tipoci.find_by_tipo("Cobranca Gerencial")
