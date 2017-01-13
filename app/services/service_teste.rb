class ServiceTeste
  def go
    ci = Ci.find(12236)
    b =  '{ "fields" : { "tipoCobranca":"2", "Owner":"lixao" , "notificacao":"eBRQ" , "statusci_id":"8"}}'
    # b =  '{ "fields" : { "tipoCobranca" : 0}}'
    a = JSON.parse(b)
    a["fields"].each do |x|
      puts x
      puts "Metodo #{x[0]} = #{x[1]}"
      begin
        ci.send("#{x[0]}=", x[1])
      rescue
      end
    end
    ci.save!
  end
end
