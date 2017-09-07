class ServiceMaskFunc

  def DePara(de)
    de = "" if de.blank?
    para = []
    de.gsub(";",",").gsub("/",",").split(",").each do |c|
      begin
        para << @hmf[c][0].para 
      rescue
        para << de
      end
    end
    para = [de] if para.blank? 
    para.join(",")
  end

  def go
    @hmf = MaskFunc.all.group_by(&:de)
    Ci.all.each do |ci|
      begin
        ci.chave = ci.chave.strip
        ci.Owner = DePara(ci.Owner)
        ci.notificacao = DePara(ci.notificacao)
        ci.save!
      rescue
      end
    end
    return "ok"
  end
end

