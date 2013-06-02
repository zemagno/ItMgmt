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
	    puts @st
	    @st
	 end

end
