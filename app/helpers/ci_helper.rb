module CiHelper
  def helper_gen_combobox(s, default)
		@st = ""
	    if s != nil then 
	      s.split(',').each do |c|
	      	if default==c
	           @st = @st + "<option value='"+c+"' selected='selected'>"+c+"</option>"
	        else
	           @st = @st + "<option value='"+c+"'>"+c+"</option>"
			end	      
	      end
	    end
	    @st
	 end

	 def helper_login_to_url(login)
	 	if login =~ /^[a-zA-z.]+$/
	 	   res = link_to(login,"/custom/GestaoUsuarios?search=#{login}",:target => "_blank" )
	 	else 
	 	   res = login
	 	end
	 	res	
	 end

end
