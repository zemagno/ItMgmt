require 'csv'
class ServiceCargaGenericoCustom

  def go(paramfile)
    detalhe = ""
    status = "ok"
    erros = ""

    total_update = 0
    total_readed = 0
    
    parametro = Parametro.getJson({:tipo => "CARGA_GENERICA", :subtipo => paramfile})


    entidade = parametro[:entidade]
    conexao = parametro[:conexao]
    chave = parametro[:chave]
    sql = parametro[:sql]


    klass = Module.const_get entidade

    @old_connection = ActiveRecord::Base.connection

    # TODO - fazer tratamento de erro nos parametros, e principalmente no SQL..

    begin
        @connection ||=  ActiveRecord::Base.establish_connection(conexao).connection
        start = Time.now
    
        mysql_res = @connection.execute("SET SESSION group_concat_max_len = 10000;")
        mysql_res = @connection.execute(sql)

        finish = Time.now
        @resultado = []
        mysql_res.each{ |res| @resultado << res }
        total_readed = mysql_res.count

        @campos = mysql_res.fields

        @connection =  ActiveRecord::Base.establish_connection(Rails.env.to_sym)
    
        @resultado.each do |res|
          func = klass.where("#{chave}=?",res[0]).first
          if func
            @campos[1..999].each_with_index do |campo,index|
               func.send("#{campo}=",res[index+1])
            end
            func.save!
            total_update = total_update + 1
          end
        end

          
    rescue => error
      Rails.logger.debug error.backtrace
      status = "Erro"
      erros = error.to_s
    
    ensure
         # this_code_will_execute_always()
    end
      
      
    detalhe << "Total de registros Lidos: #{total_readed} / Total de registros atualizados #{total_update} "
    detalhe << erros if ! erros.blank?
    Event.register("CargaGenericoCustom", paramfile, "detalhe", "#{status} - #{detalhe}")
    [status, detalhe]
  end
end