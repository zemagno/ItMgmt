require 'extendjira'
class Jira
   class << self
     	def server
	       	@server ||= JIRA::Client.new({
	            :username => 'magno',
	            :password => 'Jcmnkl##3', 
	            :site     => 'http://jiracorp.brq.com',
	            :context_path => '',
	            :use_ssl=>false, 
	            :auth_type => :basic
	          })
     	end

     	
    end
    attr_accessor :ticket
   

	def get_ticket(option)
		@ticket = Jira.server.Issue.find(option)
		self
	end

	def link_ticket(option)
		# option = option.ticket.key if option.kind_of?(Jira)
		link = {}
		link["type"] = {}
		link["type"]["name"] = "Relates"
		link["inwardIssue"] = {}
		link["inwardIssue"]["key"] = ticket.key
		link["outwardIssue"] = {}
		link["outwardIssue"]["key"] = option.ticket.key if option.kind_of?(Jira)
		
        issue = Jira.server.IssueLink.build
        issue.save(link)
        issue
		
	end
			# {
			#  "type" => {
			#     "<name></name>" => "Relates" 
			#  }, 
			#  "inwardIssue" => { 
			#     "key" =>  "INFRAII-10" 
			#  }, 
			#   "outwardIssue" => { 
			#      "key" => "INFRAII-8"
			#  }
			# }

	def create_ticket(options)
		issue = {}
		issue["fields"]={}
		issue["fields"]["issuetype"] = {}
		issue["fields"]["assignee"] = {}
		issue["fields"]["customfield_13069"]={}
		issue["fields"]["project"]={}
		issue["fields"]["customfield_13000"] = {}
		issue["fields"]["assignee"] = {}

		issue["fields"]["project"]["key"]="INFRAII"
		issue["fields"]["issuetype"]["id"]="132"
		issue["fields"]["customfield_13069"]["id"]="14414"
		issue["fields"]["customfield_13000"]["value"]="Brasil"
		
		
		issue["fields"]["summary"]=options[:titulo]
		issue["fields"]["customfield_13059"]=options[:itens] #{ }"Foi Testado ? \r\nFoi pre-negociado com as areas envolvidas ? \r\nComunicacao Externa OK ? \r\nComunicacao Interna OK ? \r\nNecessita notificar area de suporte interno ? \r\nNecessita treinamento para area de suporte interno ? \r\nPlano de instalacao OK ? \r\nPlano de Roll-Back OK ? \r\nPlanos foram aprovados ? \r\n"
		issue["fields"]["assignee"]["name"]=options[:responsavel] #{ }"magno"
		@ticket = Jira.server.Issue.build
		
		@ticket.save(issue)
		# TODO se vier com erro, nao consigo fazer o fetch.
		@ticket.fetch
		self
	end

	# def create_issue_field(issue,key,value)
	# 	issue["fields"][key]["id"]=value if ! value.blank?
	# end

	def create_sub_tarefa(options)
		issue = {}
		issue["fields"]={}
		issue["fields"]["issuetype"] = {}
		issue["fields"]["assignee"] = {}
		issue["fields"]["customfield_13069"]={}
		issue["fields"]["project"]={}
		issue["fields"]["customfield_13000"] = {}
		issue["fields"]["assignee"] = {}
		issue["fields"]["parent"] = {}

		issue["fields"]["project"]["key"]="INFRAII"
		issue["fields"]["issuetype"]["id"]="270"
		issue["fields"]["issuetype"]["subtask"]=true
		
		issue["fields"]["customfield_13069"]["id"]="14414"
		issue["fields"]["customfield_13000"]["value"]="Brasil"
		
		
		issue["fields"]["summary"]=options[:titulo]
		issue["fields"]["parent"]["key"]=options[:ticket_pai]
		
		issue["fields"]["customfield_13059"]=options[:itens] #{ }"Foi Testado ? \r\nFoi pre-negociado com as areas envolvidas ? \r\nComunicacao Externa OK ? \r\nComunicacao Interna OK ? \r\nNecessita notificar area de suporte interno ? \r\nNecessita treinamento para area de suporte interno ? \r\nPlano de instalacao OK ? \r\nPlano de Roll-Back OK ? \r\nPlanos foram aprovados ? \r\n"
		issue["fields"]["assignee"]["name"]=options[:responsavel] #{ }"magno"
		@ticket = Jira.server.Issue.build
		@ticket.save(issue)
		@ticket.fetch
		self
	end
     
end


# ticket = JiraConn.new(:titulo => "Horario de Verao", :itens => "itens..", :responsavel => "magno")
# http://blog.8thlight.com/josh-cheek/2012/10/20/implementing-and-testing-the-singleton-pattern-in-ruby.html

# a = Jira.new.get_ticket("INFRAII-18")
# b = Jira.new.get_ticket("INFRAII-5")
# a.link_ticket(b)
# 
# 
# options = { :titulo => 'subtarefa II do 18', :ticket_pai => 'INFRAII-18', :itens => 'um unico item\r\nnao, dois itens', :responsavel => 'magno'}
# c = Jira.new.create_sub_tarefa(options)