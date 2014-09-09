class JiraHelper
  
  def self.to_url(jira)
    @URLs = []
	    if jira != nil then 
	        jira.split(',').each do |c|
	      	if c.include? "INFRA"
                   @URLs << [c,"http://jiracorp.brq.com/browse/#{c}"]
            elsif c.include? "INFR-"
                   @URLs << [c,"http://jira.brq.com/browse/#{c}"]
            end
	    end
	    end
	@URLs
  end
  
  def self.to_url2(jira)
    @URLs = []
      if jira != nil then 
          jira.split(',').each do |c|
          if c.include? "INFRA"
                   @URLs << [c,"http://jiracorp.brq.com/browse/#{c}"]
            elsif c.include? "INFR-"
                   @URLs << [c,"http://jira.brq.com/browse/#{c}"]
            end
      end
      end
  @URLs
  end
  class << self
    def customFields
      if @customFields.nil?
          jiraCorp = JSON.parse(Parametro.get(:tipo => "JIRA", :subtipo => "IssueFields".gsub!(/\n?/, "")))
          fields = Parametro.list(:tipo => "Jira Issue Field")
          @customFields = []
          fields.each { |f| @customFields << [f[1],f[2],retrieve_issuefields_values(jiraCorp,f[2])] } 
      end
      @customFields  
    end

    # TODO isso aqui nao vai servir. Eu tenho que pegar todo dia ou de x em x horas. 
    # nao tenho como interceptar quando alguem alterar o parametros(JIRA,IssueFields)
    def clearCustomFields
      @customFields = nil
    end
  end
  
end
