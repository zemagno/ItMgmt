Tipoci.all.each do |tipoCi|
  out_file = File.new("templates/tmp/create_#{tipoCi.tipo}.rb".gsub(/\s+/, ""), "w")

comandos_iniciais = <<FIMCOMANDOSINICIAIS
# Encoding: utf-8
begin
  tipoci = Tipoci.create({:tipo => \"#{tipoCi.tipo}\"})
FIMCOMANDOSINICIAIS

  out_file.puts comandos_iniciais
  target = Dicdado
  limpaCampo = ["id","created_at","updated_at"]
  fields = target.column_names
  fields.delete_if { |f| limpaCampo.include? f}
  ar = target.name
  tipoCi.dicdados.each do |dicdado|
    st = ""
    fields.each do |f|
      st << "," if ! st.blank?
      st << "#{f}: \"#{dicdado.send(f)}\"" if ! f.include? "_id"
      st << "#{f}: tipoci.id" if  f.include? "tipoci_id"

    end
    out_file.puts "  tipoci.dicdados.create({#{st}})"
  end
comandos_iniciais = <<FIMCOMANDOSINICIAIS
rescue
end
tipoci = Tipoci.find_by_tipo(\"#{tipoCi.tipo}\")
FIMCOMANDOSINICIAIS

  out_file.puts comandos_iniciais

  out_file.close
end

