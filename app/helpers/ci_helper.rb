module CiHelper
  def helper_gen_combobox(s, default)
		@st = ""
	    if s != nil then 
	      if s =~ /\[(.*)\]/
	         s = eval($1).join(",")
	      end	
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
	 	if (login =~ /^[a-zA-z.]+$/) && ( Features.has? "gestaousuarios")
	 	   res = link_to(login,"/GestaoUsuarios?search=#{login}",:target => "_blank" )
	 	else 
	 	   res = login
	 	end
	 	res	
	 end

end
